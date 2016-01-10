if defined?(ChefSpec)
  def install_git_version(version)
    ChefSpec::Matchers::ResourceMatcher.new(:swpr_git_version, :install, version)
  end
end
