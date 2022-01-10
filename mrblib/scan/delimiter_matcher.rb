module Scan
  class DelimiterMatcher
    def initialize(delimiter:)
      @delimiter_regex = Regexp.compile delimiter
    end

    def match(line)
      format_params = {}
      index = 0
      [line, *line.split(@delimiter_regex)].each do |capture|
        format_params[index] = capture
        index += 1
      end
      format_params
    end
  end
end
