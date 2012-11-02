require "guerilla_patch/version"

module GuerillaPatch
  class << self
    def patch(obj, name, &block)
      if Object.respond_to?(:refine, true)
        refine_obj(obj, name, &block)
      else
        obj.class_exec(&block)
      end

      obj
    end

    private

    def refine_obj(obj, name, &block)
      m = Module.new do
        refine(obj, &block)
      end

      Object.const_set(name, m)
    end
  end
end
