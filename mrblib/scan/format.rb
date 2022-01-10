module Scan
  class Format
    def self.build(template_string)
      self.new(template_string)
    end

    def initialize(template_string)
      remain = template_string
      @sseq = []
      while m = remain.match(/^(.*?)\{(.+?)\}(.*)$/)
        @sseq.push([:string, m[1]])
        capture = m[2].match?(/\d+/) ? m[2].to_i : m[2]
        @sseq.push([:capture, capture])
        remain = m[3]
      end
      @sseq.push([:string, remain])
    end

    def render(params)
      @sseq.map do |type, value|
        case type
        when :string
          value
        when :capture
          params[value]
        else
          raise "Unexpected object: #{[type, value].inspect}"
        end
      end.join("")
    end
  end
end
