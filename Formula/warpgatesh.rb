# frozen_string_literal: true

# Synchronize Warpgate targets with OpenSSH and the independent agent.
class Warpgatesh < Formula
  desc "Synchronize Warpgate SSH targets with local OpenSSH aliases"
  homepage "https://github.com/M0okz/warpgatesh"
  url "https://github.com/M0okz/warpgatesh/archive/refs/tags/v0.1.25.tar.gz"
  sha256 "757f77f44f0e8a5a4ecb3305d1c8185f5b9b12b6f1a87f0003b26922fe4a76e3"
  license "Apache-2.0"
  head "https://github.com/M0okz/warpgatesh.git", branch: "main"

  depends_on "pkgconf" => :build
  depends_on "rust" => :build
  depends_on "openssl@3"

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/warpgatesh-cli")
    system "cargo", "install", *std_cargo_args(path: "crates/warpgatesh-agent")
  end

  def caveats
    message = <<~EOS
      Start the per-user synchronization agent after installation:
        warpgatesh agent install
    EOS
    return message unless OS.linux?

    message + <<~EOS
      Linux requires a desktop Secret Service provider such as GNOME Keyring
      or KWallet, plus a working systemd user session.
    EOS
  end

  test do
    assert_match "warpgatesh", shell_output("#{bin}/warpgatesh --version")
    assert_match "Usage: warpgatesh-agent", shell_output("#{bin}/warpgatesh-agent --help")
  end
end
