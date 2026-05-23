# typed: false
# frozen_string_literal: true

class Fing < Formula
  desc "Local IPv4 network scanner with device fingerprints"
  homepage "https://github.com/mi2428/fing"
  version "0.9.4"
  license "MIT"
  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/mi2428/fing/releases/download/v0.9.4/fing-v0.9.4-darwin-arm64",
          using: :nounzip
      sha256 "bca347cd927b32aaf027730b13fa8b649bf0a546bd65cd7e87693a63039095ff"
    end

    on_intel do
      url "https://github.com/mi2428/fing/releases/download/v0.9.4/fing-v0.9.4-darwin-amd64",
          using: :nounzip
      sha256 "1c04f592af5fa328d401db38bc5309d6382f6fa12eb21bb907e69a12354bccb1"
    end
  end

  def install
    bin.install Dir["fing-v#{version}-darwin-*"].first => "fing"
    chmod 0755, bin/"fing"
  end

  test do
    assert_match "fing #{version}", shell_output("#{bin}/fing --version")
    assert_match "Usage:", shell_output("#{bin}/fing --help")
  end
end
