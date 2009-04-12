module Feedzirra
  ##
  # Contrary to Feedzirra::Feed, Feedzirra::PushParser doesn't expect
  # the whole document to be given in one String, but allows
  # subsequent parsing of chunks.
  class PushParser
    ##
    # How many bytes to buffer before starting to parse, helps
    # Feedzirra's content detection.
    BUF_MIN_THRESHOLD = 1000

    ##
    # Just resets instance variables
    def initialize
      @buf = ''
      @parser = nil
    end

    ##
    # Either buffer up til BUF_MIN_THRESHOLD or, if reached, actually
    # parse a chunk
    def push(chunk)
      if @parser
        @parser.parse(chunk)
      else
        @buf += chunk
        if @buf.size > BUF_MIN_THRESHOLD
          start_parsing
        end
      end
    end

    ##
    # Really start parsing, if BUF_MIN_THRESHOLD wasn't reached yet,
    # finalize, and return the actual parser/document
    def finish
      # TODO: if we haven't started yet we won't even need a
      # PushParser
      start_parsing unless @parser

      @parser.parse_finish
      @parser
    end

    private

    def start_parsing
      unless klass = Feed::determine_feed_parser_for_xml(@buf)
        raise NoParserAvailable.new("No valid parser for XML.")
      end
      @parser = klass.new
      @parser.parse(@buf)
      @buf = nil
    end
  end
end
