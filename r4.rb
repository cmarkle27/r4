#!/usr/bin/env ruby
# r4
# == Synopsis
#   A cli connect-four game
#
# == Usage
#   r4 -p [column]
#   For help use: r4 -h
#
# == Options
#   -h, --help          Displays help message
#   -v, --version       Display the version, then exit
#   TO DO - add additional options
#
# == Author
#   Chris Markle
#
# == Copyright
#   Copyright (c) 2013 Chris Markle. Licensed under the MIT License:
#   http://www.opensource.org/licenses/mit-license.php
#
# == Credits
#   code inspired by http://blog.toddwerth.com/entries/5

require 'optparse'
require 'rdoc/usage'
require 'ostruct'

class App

  VERSION = '0.0.1'

  attr_reader :options

  def initialize(arguments, stdin)
    @arguments = arguments
    @stdin = stdin

    # Set defaults
    @options = OpenStruct.new
    @options.verbose = false
    @options.quiet = false
    @options.move = 0
  end

  # Parse options, check arguments, then process the command
  def run
    if parsed_options? && arguments_valid?
      process_arguments
      process_command
    else
      output_usage
    end
  end

  protected

    def parsed_options?
      opts = OptionParser.new
      opts.on('-v', '--version')    { output_version ; exit 0 }
      opts.on('-h', '--help')       { output_help }
      opts.on('-p', '--play')       { play }

      opts.parse!(@arguments) rescue return false

      process_options
      true
    end

    def process_options
      #@options.verbose = false if @options.quiet

    end

    def arguments_valid?
      # TO DO - implement your real logic here
      true if @arguments.length == 1
    end

    def process_arguments
      # TO DO - place in local vars, etc
    end

    def output_help
      output_version
      RDoc::usage() #exits app
    end

    def output_usage
      RDoc::usage('usage') # gets usage from comments above
    end

    def output_version
      puts "#{File.basename(__FILE__)} version #{VERSION}"
    end

    def play
      @options.move = @arguments[0]
      puts "you have dropped a chip in column " + @options.move
    end

    def process_command
      # TO DO - do whatever this app does
      #process_standard_input # [Optional]
    end

    def process_standard_input
      input = @stdin.read
      # TO DO - process input

      # [Optional]
      #@stdin.each do |line|
      #  # TO DO - process each line
      #end
    end
end


# TO DO - Add your Modules, Classes, etc


# Create and run the application
app = App.new(ARGV, STDIN)
app.run