# setup.rb
#
# SUMMARY
#
#   Common header script that handles boiler plate for Ruby based scripts.

#
# Setup
#

# Changes into the scripts directory so that we can load the Bundler
# dependencies. Unfortunately, Bundler does not provide a way load a Gemfile
# outside of the cwd.
Dir.chdir "scripts"

#
# Requires
#

require "rubygems"
require "bundler"

begin
  Bundler.require(:default)
rescue Bundler::GemNotFound => e
  puts(
    <<~EOF
    You're missing a required Ruby gem dependency:

        #{e.message}

    Make sure you've installed all gems:

        cd scripts
        bundle install

    Alternatively, you can use our Docker environment via

        make environment
        make <your-target>

    EOF
  )
  exit(1)
end

require "date"
require_relative "util"

#
# Constants
#

HOST = "https://vector.dev".freeze
DOCS_BASE_PATH = "/docs".freeze
GUIDES_BASE_PATH = "/guides".freeze
HIGHLIGHTS_BASE_PATH = "/highlights".freeze
POSTS_BASE_PATH = "/blog".freeze
RELEASES_BASE_PATH = "/releases".freeze

ROOT_DIR = Pathname.new("#{Dir.pwd}/..").cleanpath.to_s.freeze
ASSETS_ROOT = File.join(ROOT_DIR, "static").freeze
BLOG_HOST = "#{HOST}/blog".freeze
DOCS_ROOT = File.join(ROOT_DIR, "docs").freeze
DOCS_HOST = "#{HOST}#{DOCS_BASE_PATH}".freeze
GUIDES_ROOT = File.join(ROOT_DIR, "guides").freeze
HIGHLIGHTS_HOST = "#{HOST}#{HIGHLIGHTS_BASE_PATH}".freeze
HIGHLIGHTS_ROOT = File.join(ROOT_DIR, "highlights").freeze
META_ROOT = File.join(ROOT_DIR, "vector", ".meta").freeze
PAGES_ROOT = File.join(ROOT_DIR, "src", "pages").freeze
POSTS_ROOT = File.join(ROOT_DIR, "blog").freeze
REFERENCE_ROOT = File.join(ROOT_DIR, "docs", "reference").freeze
RELEASES_ROOT = File.join(ROOT_DIR, "releases").freeze
RELEASES_HOST = "#{HOST}#{RELEASES_BASE_PATH}".freeze
RELEASE_META_DIR = "#{META_ROOT}/releases".freeze
PARTIALS_DIR = File.join(ROOT_DIR, "scripts", "generate", "templates", "_partials").freeze
STATIC_ROOT = File.join(ROOT_DIR, "static").freeze

OPERATING_SYSTEMS = ["Linux", "MacOS", "Windows"].freeze
