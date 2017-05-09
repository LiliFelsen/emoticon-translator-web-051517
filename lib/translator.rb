# require modules here
require 'yaml'

def load_library(file_path)
  library = {
    "get_meaning" => {},
    "get_emoticon" => {}
  }

  YAML.load_file(file_path).each do |emoticons_meaning, emoticons_array|
    english_emoticons = emoticons_array[0]
    japanese_emoticons = emoticons_array[1]
    library["get_meaning"][japanese_emoticons] ||= {}
    library["get_meaning"][japanese_emoticons] = emoticons_meaning
    library["get_emoticon"][english_emoticons] ||= {}
    library["get_emoticon"][english_emoticons] = japanese_emoticons
  end
  library
end

def get_japanese_emoticon(file_path, emoticon)
  library = load_library(file_path)
    if library["get_emoticon"][emoticon]
      japanese_emoticon = library["get_emoticon"][emoticon]
      return japanese_emoticon
    else
      return "Sorry, that emoticon was not found"
    end
end

def get_english_meaning(file_path, emoticon)
    library = load_library(file_path)
    if library["get_meaning"][emoticon]
      english_meaning = library["get_meaning"][emoticon]
      return english_meaning
    else
      return "Sorry, that emoticon was not found"
    end
end
