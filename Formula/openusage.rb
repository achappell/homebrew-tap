# typed: false
# frozen_string_literal: true

class Openusage < Formula
  desc "Monitor your AI coding tool quotas from a single TUI dashboard"
  homepage "https://openusage.sh"
  version "0.27.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/achappell/openusage/releases/download/v0.27.0/openusage_0.27.0_darwin_arm64.tar.gz"
      sha256 "3c724b407dcea0b5a086aac10436f0036a1fe4becf9b98a674ef220363be337d"
    else
      url "https://github.com/achappell/openusage/releases/download/v0.27.0/openusage_0.27.0_darwin_amd64.tar.gz"
      sha256 "b9a66975f5998d5ebb6957c9de3e1fda2ba8982e7dbef38aec231eea3fb95816"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/achappell/openusage/releases/download/v0.27.0/openusage_0.27.0_linux_arm64.tar.gz"
      sha256 "6c7c85354cdb67e06ecd23462bd23d17203c2399bd272d02cc78b7ef5ffe58d1"
    else
      url "https://github.com/achappell/openusage/releases/download/v0.27.0/openusage_0.27.0_linux_amd64.tar.gz"
      sha256 "736b64c3ce547ed0a152baf74ed4e13b1361b89929f076db8fb98183c365fb62"
    end
  end

  def install
    bin.install "openusage"
  end

  def caveats
    <<~EOS
      If `openusage` is missing after an install or upgrade, the keg is
      installed but unlinked. There are two known causes.

      1. Tap trust. Homebrew 6.0+ requires third-party taps to be trusted,
         and a trust grant only covers the formula version it was made for,
         so each `brew update` that bumps openusage can leave the keg
         unlinked. Trust the whole tap once to keep it linked across
         upgrades:

 brew trust achappell/tap

         See https://docs.brew.sh/Tap-Trust for details.

      2. Tap ambiguity. If another installed tap also defines a formula
         named "openusage", Homebrew cannot resolve the bare name and
         skips the link step. Check with:

 brew info --formula openusage

         An error reading "Formulae found in multiple taps" confirms it.
         Remove the tap you do not use, or always use the fully-qualified
         name.

      Either way, this restores the command immediately:

        brew link achappell/tap/openusage
    EOS
  end

  test do
    assert_match "openusage", shell_output("#{bin}/openusage --version 2>&1", 0)
  end
end
