class ClaudeProfile < Formula
  desc "Switch between Claude Code configuration profiles"
  homepage "https://github.com/yarikleto/claude-profile"
  url "https://github.com/yarikleto/claude-profile/archive/refs/tags/v2.0.5.tar.gz"
  sha256 "f3b1ba97fc4f90687616bc3ed37e6ded7e293688310ea74585198983f24bd0c4"
  license "MIT"

  depends_on "bash"

  def install
    libexec.install "lib", "commands", "VERSION"
    bin.install "claude-profile"
    inreplace bin/"claude-profile",
      /^SCRIPT_DIR=.*/, "SCRIPT_DIR=\"#{libexec}\""
    zsh_completion.install "completions/claude-profile.zsh" => "_claude-profile"
    bash_completion.install "completions/claude-profile.bash" => "claude-profile"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/claude-profile version")
  end
end
