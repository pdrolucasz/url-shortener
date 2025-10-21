module Base62Converter
    ALPHABET = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789".freeze()
    BASE = ALPHABET.length.freeze()

    def self.encode(num)
        return ALPHABET[0] if num == 0 # Handle zero explicitly
        base62_str = ""
        while num > 0
            base62_str << ALPHABET[num % BASE]
            num /= BASE
        end
        base62_str.reverse
    end

    def self.decode(str)
        num = 0
        str.each_char.with_index do |char, index|
            value = ALPHABET.index(char)
            num += value * (BASE**(str.length - 1 - index))
        end
        num
    end
end
