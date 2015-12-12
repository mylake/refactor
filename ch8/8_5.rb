class Module
  def deprecate(methodName, &block)
    module_eval <<-END
      alias_method :deprecate_#{methodName}, :#{methodName}
      def #{methodName}(*args, &block)
        $stderr.puts "Warning: calling deprecated method\
        #{self}.#{methodName}. This method will be removed in a future release."
        deprecated_#{methodName}(*args, &block)
      end
    END
  end
end


class Foo
  def foo
    puts "foo method"
  end

  deprecate :foo
end
