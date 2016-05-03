module Mames
  class FormatterService
    def initialize(arguments = {}, service_response)
      @command  = arguments[:command]
      @service_response = service_response
    end

    def call
      run_command
    end

    private

    def run_command
      if @command == 'get'
        format_get
      elsif @command == 'score'
        format_score
      end.join("\n")
    end

    def format_get
      @service_response.map(&:quote)
    end

    def format_score
      @service_response.map { |mame| "#{mame[0]}: #{mame[1]}"  }
    end
  end
end
