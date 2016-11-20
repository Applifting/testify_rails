module Testify
  class Engine < ::Rails::Engine
    isolate_namespace Testify
    config.autoload_paths << Engine.root.join('../testify')
  end
end
