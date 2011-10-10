module Guard
  class RailsAssets::CliRunner
    def initialize(options={})
      @rails_env = (options[:rails_env] || 'test').to_s
      @digest    = options[:digest]
      @digest    = true if @digest.nil?
    end

    def compile_assets
      task = "assets:precompile"
      task += ":nondigest" unless @digest
      system "RAILS_ENV=#{@rails_env} bundle exec rake assets:clean #{task}"
    end
  end
end
