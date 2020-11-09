# frozen_string_literal: true

def soundex(names)
  names.split().each.with_index do |name, index|
    arr_name = name.split("")
    first_letter = arr_name.shift
    names[index] = arr_name.map.with_index do |letter, index|
      new_letter = consonants_replacement(letter)
      next if new_letter.nil?

      arr_name.delete(letter) if ['a', 'e', 'i', 'o', 'u', 'y'].include?(letter)
      arr_name[index] = new_letter
    end

  end
end

def consonants_replacement(letter)
  {
    'b' => 1,
    'f' => 1,
    'p' => 1,
    'v' => 1,
    'c' => 2,
    'g' => 2,
    'j' => 2,
    'k' => 2,
    'q' => 2,
    's' => 2,
    'x' => 2,
    'z' => 2,
    'd' => 3,
    't' => 3,
    'l' => 4,
    'm' => 5,
    'n' => 5,
    'r' => 6
  }[letter]
end


soundex("Sarah Connor")
jakub
