module EzChaff
  
  def self.randomize_full_ascii(length = 10)
    unless defined?(EzChaff::RANDOM_STRING_SEED)
      chars = Array.new(255,nil)
      255.times do |char|
        chars[char] = (char + 1).chr
      end
      EzChaff.const_set('RANDOM_STRING_SEED',chars)
    end
    chars = EzChaff::RANDOM_STRING_SEED
    new_string = ""
    rand_limit = EzChaff::RANDOM_STRING_SEED.size - 1
    1.upto(length) { |i| new_string << chars[rand(rand_limit)] }
    return new_string
  end
  
  def self.chaff(string)
    how_much_chaff = string.length
    chaff = EzChaff.randomize_full_ascii(how_much_chaff)
    chaffed_string = ''
    string.length.times do |pos|
      chaffed_string << "#{string[pos,1]}#{chaff[pos,1]}"
    end
    return chaffed_string
  end
  
  def self.unchaff(string)
    unchaffed_string = ''
    chaff = false
    string.length.times do |pos|
      unchaffed_string << string[pos,1] unless chaff
      chaff = ! chaff
    end
    return unchaffed_string
  end
  
end
