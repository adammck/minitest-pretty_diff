require "json"

module MiniTest
  module Assertions

    #
    # Returns a pretty-printed version of +obj+.
    #
    def mu_pp(obj)
      s = if obj.is_a?(Hash) || obj.is_a?(Array)
        JSON.pretty_generate(sort_keys(obj))
      else
        obj.inspect
      end

      s = s.encode(Encoding.default_external) if defined? Encoding
      s
    end

    #
    # Recursively sort the keys of +obj+, which is typically a hash. Recurses
    # into arrays (to allow nested structures), but does not sort them.
    #
    def sort_keys(obj)
      if obj.is_a?(Hash)
        obj.keys.sort.reduce(Hash.new) do |memo, key|
          memo.merge({ key => sort_keys(obj[key]) })
        end
      elsif obj.is_a?(Array)
        obj.map do |item|
          sort_keys(item)
        end
      else
        obj
      end
    end
  end
end
