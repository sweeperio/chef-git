#
# Cookbook Name:: git
# Spec:: default
#
# The MIT License (MIT)
#
# Copyright (c) 2016 sweeper.io
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.

describe "git_version resource" do
  cached(:chef_run) do
    runner = ChefSpec::SoloRunner.new(step_into: %w(git_version)) do |node|
      node.set["git"]["version"] = "2.7.0"
    end

    runner.converge("git::default")
  end

  it "installs prequisite packages" do
    resource = chef_run.find_resource(:git_version, chef_run.node.attr!("git", "version"))
    resource.class::PREREQUISITES.each do |package|
      expect(chef_run).to install_package(package)
    end
  end

  it "makes and installs git" do
    expect(chef_run).to install_with_make_ark("git").with(
      version: chef_run.node.attr!("git", "version"),
      make_opts: %w(prefix=/usr/local)
    )
  end
end
