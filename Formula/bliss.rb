class Bliss < Formula
  VERSION = '1.0.24'
  version "#{VERSION}"
  desc 'Bliss Enterprise Tool for local repository analysis.'
  homepage 'https://github.com/founderbliss/docker'
  url "https://github.com/founderbliss/bliss-cli/archive/#{VERSION}.tar.gz"
  sha256 '6dc70b5df8a93fdfcaebd6c4884fdd91d86104128c3d203c08770252df852abc'
  head 'https://github.com/founderbliss/bliss-cli.git'

  def install
    lib.install Dir['lib/**']
    prefix.install Dir['scripts']
    prefix.install 'blisscollector.rb'
    prefix.install 'Dockerfile'
    prefix.install 'Gemfile'
    exec_command = "#!/bin/sh\nruby #{prefix}/blisscollector.rb \"$@\""
    File.write('bin/bliss', exec_command)
    bin.install Dir['bin/bliss']
  end

  test do
    system 'bliss', 'help'
  end
end
