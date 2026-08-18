# typed: false
# frozen_string_literal: true

class Openusage < Formula
  desc "Monitor your AI coding tool quotas from a single TUI dashboard"
  homepage "https://openusage.sh"
  version "0.26.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/achappell/openusage/releases/download/v0.26.2/openusage_0.26.2_darwin_arm64.tar.gz"
      sha256 "415b955bf051d94545789809a73c1c1e6b9b74f1857fcf0e103947bd4de70241"
    else
      url "https://github.com/achappell/openusage/releases/download/v0.26.2/openusage_0.26.2_darwin_amd64.tar.gz"
      sha256 "e72b5987608aa11895c2670a5091eb249e8dcee334fdc39406778c2b4bf1c728"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/achappell/openusage/releases/download/v0.26.2/openusage_0.26.2_linux_arm64.tar.gz"
      sha256 "27820f60569ea5ced9ff451234387f65b6594a1b8ce375e4abca44e004d30a54"
    else
      url "https://github.com/achappell/openusage/releases/download/v0.26.2/openusage_0.26.2_linux_amd64.tar.gz"
      sha256 "b56296fc5820441fe77fdc335de9be6180f31a08c3122bc0d5be0952d1eae275"
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
