module RNOC
  # Allows accessing config variables from rnoc.yml like so:
  # RNOC[:logo] => [my sweet logo image]

  def self.[](key)
    unless @config
      raw_config = File.read("config/rnoc.yml")
      @config = HashWithIndifferentAccess.new(YAML.load(raw_config))
    end
    @config[key]
  end

  def self.[]=(key, value)
    @config[key.to_sym] = value
  end
end
