# require modules
require 'yaml' 
require 'pry'

def load_library(file_path)
  # code goes here
  result = Hash.new
  library = YAML.load_file(file_path)
  library.each do |key, value|
    result[key] = {}
    result[key][:english] = value[0]
    result[key][:japanese] = value[1]
  end
  result
end
 

def get_japanese_emoticon(path, emoticon)
  library = load_library(path)
  library.each do |key,value|
    if emoticon == value[:english]
      return value[:japanese]
    end
  end
  return "Sorry, that emoticon was not found"
end

def get_english_meaning(path, emoticon)
  library = load_library(path)
  library.each do |key,value|
    if emoticon == value[:japanese]
      return key
    end
  end
  return "Sorry, that emoticon was not found"
end
