# typed: false
# frozen_string_literal: true

class Openusage < Formula
  desc "Monitor your AI coding tool quotas from a single TUI dashboard"
  homepage "https://openusage.sh"
  version "0.25.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/achappell/openusage/releases/download/v0.25.0/openusage_0.25.0_darwin_arm64.tar.gz"
      sha256 "a06bef3e971f46361db105c8ab30a1c197187f38bb1b98f497a1630bd0cebf6c"
    else
      url "https://github.com/achappell/openusage/releases/download/v0.25.0/openusage_0.25.0_darwin_amd64.tar.gz"
      sha256 "7dbaf32e5b19812f3296174da1aa2a5c767ed7c911009d87c9d176a9266ba974"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/achappell/openusage/releases/download/v0.25.0/openusage_0.25.0_linux_arm64.tar.gz"
      sha256 "29df50baf5f1516458101a759041606b17afee560eef22fbdfe3637ee45da828"
    else
      url "https://github.com/achappell/openusage/releases/download/v0.25.0/openusage_0.25.0_linux_amd64.tar.gz"
      sha256 "cffda9092b52ba86d8ea7850f3edcca27da84d0341743585363464afdcfd0b2e"
    end
  end

  def install
    bin.install "openusage"
  end

  def caveats
    <<~EOS
      Homebrew 6.0+ requires third-party taps to be trusted. A trust grant
      only covers the formula version it was made for, so each `brew update`
      that bumps openusage can leave the keg installed-but-unlinked
      ("command not found" until you run `brew link`).

      Trust the whole tap once to keep openusage linked across upgrades:

        brew trust achappell/tap

      See https://docs.brew.sh/Tap-Trust for details.
    EOS
  end

  test do
    assert_match "openusage", shell_output("#{bin}/openusage --version 2>&1", 0)
  end
end
