require "spec_helper"

describe "swpr_git" do
  EXECUTABLES = %w(git git-cvsserver gitk git-receive-pack git-shell git-upload-archive git-upload-pack).freeze

  EXECUTABLES.each do |executable|
    describe command("which #{executable}") do
      its(:exit_status) { should eq(0) }
      its(:stdout) { should eq("/usr/local/bin/#{executable}\n") }
    end
  end
end
