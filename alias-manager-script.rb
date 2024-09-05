   class AliasManagerScript < Formula
     desc "Alias manager script to manage and execute aliases defined in your .zshrc file"
     homepage "https://github.com/noxhsxrk/alias-manager-script"
     url "https://github.com/noxhsxrk/alias-manager-script/archive/refs/tags/v1.0.0.tar.gz"
     sha256 "52d1c235d638763d461ee2e3782af86e929287f8be87a5040b6dbf916d6d1e08"
     license "MIT"

     def install
       bin.install "manual.sh" => "alias-manager"
     end

     test do
       assert_match "Available aliases:", shell_output("#{bin}/alias-manager --show-all", 0)
     end
   end
