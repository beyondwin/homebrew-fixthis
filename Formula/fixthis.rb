class Fixthis < Formula
  desc "Agent-first feedback handoff for Jetpack Compose Android apps"
  homepage "https://github.com/beyondwin/FixThis"
  url "https://github.com/beyondwin/FixThis/releases/download/v0.2.0/fixthis-cli-mcp-v0.2.0.tar.gz"
  sha256 "90bcd2870296e91b094dae3b9bfa624a7507d192fa95fe8deafacb2618f79cf3"
  license "MIT"

  depends_on "openjdk@21"

  def install
    libexec.install Dir["*"]
    java_home = Formula["openjdk@21"].opt_prefix
    (bin/"fixthis").write_env_script libexec/"fixthis/bin/fixthis", JAVA_HOME: java_home
    (bin/"fixthis-mcp").write_env_script libexec/"fixthis-mcp/bin/fixthis-mcp", JAVA_HOME: java_home
  end

  test do
    assert_match "Usage", shell_output("#{bin}/fixthis --help")
    assert_predicate bin/"fixthis-mcp", :executable?
  end
end
