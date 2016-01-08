PREREQUISITES = %w(libcurl4-gnutls-dev libexpat1-dev).freeze

default_action :install

property :version, String, name_property: true

action :install do
  PREREQUISITES.each(&method(:package))

  ark "git" do
    url "https://github.com/git/git/archive/v#{new_resource.version}.tar.gz"
    version new_resource.version
    make_opts %w(prefix=/usr/local)
    action :install_with_make
  end
end
