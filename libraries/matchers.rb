if defined?(ChefSpec)
  def install_git_version(version)
    ChefSpec::Matchers::ResourceMatcher.new(:git_version, :install, version)
  end
end
