require "yaml"
require "pry"

def load_library(library)
  library = YAML.load_file(library)
  new = {:get_meaning => {}, :get_emoticon => {}}
  #binding.pry
  library.each do |(meaning,emoticon)|
    japanese = emoticon[1]
    english = emoticon[0]
    new[:get_meaning][japanese] = meaning
    new[:get_emoticon][english] = japanese
    #binding.pry
  end
  new
 # binding.pry
end

def get_japanese_emoticon (library, emoticon)
  library = load_library(library)
  if library[:get_emoticon].keys.include?(emoticon)
  return library[:get_emoticon][emoticon]
  else
    return "Sorry, that emoticon was not found"
  end
end

def get_english_meaning (library, emoticon)
  library = load_library(library)
  if library[:get_meaning].keys.include?(emoticon)
  return library[:get_meaning][emoticon]
  else
    return "Sorry, that emoticon was not found"
  end
end

