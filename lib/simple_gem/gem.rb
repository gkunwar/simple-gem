module SimpleGem
  class Gem

    attr_reader :root_path

    def initialize(path, name)
      @root_path = path
      @name      = name
    end

    def name
      sanitized_name
    end

    def module_name
      transform_name {|part| part.capitalize }
    end

    def ruby_name
      transform_name('_') {|part| part.downcase }
    end

    def generate_structure
      generate_gem_directory
      generate_subdirectories
      generate_file('gitignore.erb', '.gitignore')
      generate_file('rvmrc.erb', '.rvmrc')
      generate_file('lib.rb.erb', "lib/#{ruby_name}.rb")
      generate_file('lib_version.rb.erb', "lib/#{ruby_name}/version.rb")
      generate_file('Rakefile.erb', 'Rakefile')
      generate_file('Gemfile.erb', 'Gemfile')
      generate_file('README.rdoc.erb', 'README.rdoc')
      generate_file('test_helper.rb.erb', 'test/test_helper.rb')
      generate_file('test.rb.erb', "test/unit/#{ruby_name}_test.rb")
    end

    def generate_gemspec
      Dir.chdir(gem_path) { `rake gemspec 2>&1` }
    end

    private

    def sanitized_name
      @name.gsub(/([A-Z])([a-z])/, '_\1\2').sub(/^_/, '').downcase
    end

    def transform_name(glue = nil, &block)
      name.split(/[_-]/).map {|part| block.call(part) }.join(glue)
    end

    def generate_gem_directory
      FileUtils.mkdir(gem_path)
    end

    def generate_subdirectories
      ['lib', 'test', "lib/#{ruby_name}", 'test/unit'].each do |dir|
        FileUtils.mkdir(path_to(dir))
      end
    end

    def generate_file(source, output)
      source_file = File.expand_path("../../../templates/#{source}", __FILE__)

      erb = ERB.new(File.read(source_file))
      File.open(path_to(output), 'w') {|f| f << erb.result(binding) }
    end

    def gem_path
      "#{root_path}/#{name}"
    end

    def path_to(target)
      "#{gem_path}/#{target}"
    end

  end
end