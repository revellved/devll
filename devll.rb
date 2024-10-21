# frozen_string_literal: true

=begin at the beginning
  remeber: goodness of code not need comments.
=end

# WARN: IT'S «DEVLL»!
# «Devll» observered types, and not only it...
class Devll
  # alias :gl :class

  module DAMN # INFO: Developers' Accepted Measuring iNstrument
    class StandardErrorDamn < StandardError ; end # INFO:: Error implement StandardError
    class CompilerErrorDamn < StandardError ; end # INFO:: Error implement StandardError
    class RuntimerErrorDamn < RuntimeError  ; end # INFO:: Error implement RuntimeError
    class FuncUnknowCmpKeep < Exception     ; end # INFO:: Error implement Exception
    class GemOfDog          < Gem::Exception; end # INFO:: Error implement Gem::Exception

    SED = StandardErrorDamn                       # INFO: Shortcut for StandardErrorDamn
    CED = CompilerErrorDamn                       # INFO: Shortcut for CompilerErrorDamn
    RED = RuntimerErrorDamn                       # INFO: Shortcut for RuntimerErrorDamn 
    GOD = GemOfDog                                # INFO: Shortcut for GemOfDog.

    class DISPUTABLE < SED; end                   # INFO: Unknow error (use default in panic).
    class BreakDance < SED; end                   # INFO: It's break dance, baby.
    class BreakTypes < CED; end                   # INFO: Type not matched.
    class BreaksArgs < RED; end                   # INFO: Argumnets not matched.
    class NoneMethod < RED; end                   # INFO: Not define method
    class NotDefMain < CED; end                   # INFO: Not define main method for class.
    class NotFindVar < RED; end                   # INFO: Variables not found.
    class UndefClass < CED; end                   # INFO: Not define class.
    class VarNotType < CED; end                   # INFO: Variables without tpe.
  end

  def pub *method_names                                         # INFO: Public methods.
    method_names.each do |method_name|                          # INFO: Foreach getter method_names.
      define_method method_name do |*args, iself:self, **kargs| # INFO: Create caller method for the instance of class. 
        meth = self.class.method(method_name)
        meth.arity == 0 ? meth.call(*args, **kargs) : meth.call(*args, **kargs, iself:iself)
      end
    end
  end

  module Pub                                                      # INFO: Public module.
    def pub *method_names                                         # INFO: Public methods.
      method_names.each do |method_name|                          # INFO: Foreach getter method_names.
        define_method method_name do |*args, iself:self, **kargs| # INFO: Create caller method for the instance of class. 
          meth = self.class.method(method_name)
          meth.arity == 0 ? meth.call(*args, **kargs) : meth.call(*args, **kargs, iself:iself)
        end
      end
    end
  end

  module Defer
    @@defers ||= []

    def defers; @@defers; end
    def defer *funcs, iself:self, &func
      @@defers.append (
        block_given? ? func : @@defers += funcs.map do |func|
          case func
          when Proc   then func
          when Method then func.to_proc
          when Symbol then iself.method(func)
          else panic "Not func"
          end
        end
      )
    end
  end

  module Panic 
    # INFO: «Isel» sorting «Arrays» and «HashMaps» using matching via «RegExp» or «String».
    def isel sexp                                                  # it's isel
      suck = ->(el){ el.inspect.downcase.gsub(sexp, "###").count("#") }     # it's suck
      sexp ? ->(el1, el2){ suck.call(el2) <=> suck.call(el1) } : ->(_,_){0} # it's sexp
    end

    # INFO: Gophers, it's for you. We know, you can't live without panics.
    #  —————————————————————————————————————————————————————————————————
    #     - Send binding in «ibinding» for calling debug (irb);
    #     - Send regexp (or string) in «sexp» for sort of ouput fields.
    def panic error=Devll::DAMN::DISPUTABLE, msg="", *args,
              iself:self, ibinding:false, raise_on:true, sexp:nil, describe:nil
      # INFO: If get one argument, then it's argument describe message (fliping arguments).
      msg, error = error, Devll::DAMN::DISPUTABLE if !error.is_a?(Class) and msg.empty?
      devll_msgs = [ # INFO: Array with lines for output
        "", "HOLY'S HIT!".center(120), # HOLYYYYYYYYYYY'S HIT!
        "                % ————————————————————————————————————————————————————————————————————————————————-—-", 
        "               /  🪲 #{error} in «#{self}» class (#{msg || "NONE ERROR MESSAGE"}) 🪲",
        "              / —————————————————————————————————————————————————————————————————————————-—-",
        "             /  ** Info for #{iself} ** #{"sort by «#{sexp}» **" if  sexp}",
        "            /", *(methods.include?(:allvar) ? [
        "           / - Your local var ❯ #{   allvar[:local].sort(&isel( sexp )).to_h}",
        "          /         class var ❯ #{   allvar[:class].sort(&isel( sexp )).to_h}",
        "         /       instance var ❯ #{allvar[:instance].sort(&isel( sexp )).to_h}", ] : []),
        "        /", *(methods.intersection(%i[ atypes fields output ]).size == 3 ? [
        "       / - Your types ❯ #{ atypes.sort(&isel( sexp )).to_h }",
        "      / - Your fields ❯ #{ fields.sort(&isel( sexp )).to_h }",
        "     / - Your outputs ❯ #{ output.sort(&isel( sexp )).to_a }", ] : []),
        "    / ———————————————————————————————————————————————————————————————————————————————-—-",
        "   / - Your tech info ❯ dir:#{__dir__}, id:#{__id__}, pid:#{$$}, argv:#{$*},",
        "  /                     ENV:#{ENV.sort(&isel( sexp )).first(6).to_h}",
        " % ————————————————————————————————————————————————————————————————————— Your Little Helper ———————————-—-",
        "", 
        *(describe.nil? ? [] : "\t\tDESCRIBE ERROR\n #{describe.gsub(/ +/, ' ')}".split("\n") ),
        "",
      ].map { |line| (line.size > 120 ? line.slice(0, 120) + "..." : line) # INFO: Strip long line in block.
                          .gsub(/❯\W*$/, "❯ #{'—'*10}$ EMPTY $#{'—'*10}")  # INFO: Fill empty fields.
                          .gsub(/[\{\}]/, '')                              # INFO: Delete spare symbols.
      }.join("\n")                                                         # INFO: Array to multiline string.

      methods.include?(:s_puts) ? s_puts(devll_msgs) : puts(devll_msgs)
      ibinding.irb     if ibinding # INFO: If get binding, then calling it.
      raise error, msg if raise_on # INFO: If raise on (default it's on), then raise.
    end
  end

  module Types # INFO: Types.
    module Dvl
      extend Devll::Pub

      def self.superclass iself:self; Types; end
      pub def self.to_sym iself:self; self.to_s.to_sym; end
    end

    class Int < Integer
      extend Dvl
      @@null=0
    end
    class Cmx < Complex
      extend Dvl
			@@null=0+0i
		end

    class Flt < Float
      extend Dvl
			@@null=0.0 
		end

    class Sym < Symbol
      extend Dvl
			@@null=:!
		end
    class Str < String
      extend Dvl
			@@null=""
		end
    class Arr < Array
      extend Dvl
			@@null=[]
		end
    class Map < Hash
      extend Dvl
			@@null={}
		end

    class Any < BasicObject
      extend Dvl
		end
    class Obj < Object
      extend Dvl
		end
 
    class XXX # INFO: Super type XXX needed for convert.
      def self.to type; Devll::Types.const_get(type).class_variable_get(:@@null) || nil; end
    end

    # INFO: Methods aliases for XXX (usual alisses not work for classes).
    def xxx; Types::XXX; end
    def xXx; Types::XXX; end

    def new_type type, rb_type # INFO: Create new Devll type.
      extend Devll::Pub

      # INFO: If type yet not exist, then add it to Types.
      eval "class Types::#{type} < #{rb_type}; end" unless Types.const_defined? type

      # INFO: Method for calling like «#{TYPE} ...», example: «Int @num = 2347».
      self.define_singleton_method type do |val=nil, iself:self|
        Devll::Types.const_get type if val.nil? # INFO: If not args, then return type
  
        var = last_var iself:iself              # INFO: Var — is last variable in that scope
        val = val.to type if val == Types::XXX  # INFO: If val is super type, then convert

        case [var.nil?, val.nil?] # INFO: Check variable and value.
        when [true,  true] then   # WARN: PANIC If not value and not var.
          panic DAMN::NotFindVar, "Expected value of var, but get nil", describe: <<-DESC
            It's catch code like: «#{type} @var» or «#{type} nil»,
            «#{type} @var» — in this case Devll can't get name of var.

            Note: Your type using for comfort. It work for all types, not only «#{type}»
          DESC
        when [true, false] then val # INFO: If not value, then return val (case for intialized var without value).
        else let var, val, rb_type  # INFO: Else create variable with value.
        end
      end

      # INFO: Method for calling like «#{TYPE}! ...». Example: «Int! @num = 2347».
      # It's different of previos method, that it method append var in require_fields.
      self.define_singleton_method "#{type}!" do |value, iself:self|
        fields_append type, value, require_fields
      end

      self.define_method "#{type}!" do |value, iself:self|
        # fields_append type, value, require_fields
        fnargs.append type
      end

      # INFO: Method for calling like «#{TYPE}? ...». Example: «Int? @num = 2347».
      # It's different of previos method, that it method append var in passive_fields.
      self.define_singleton_method "#{type}?" do |value, iself:self|
        fields_append type, value, passive_fields
      end

      # INFO: Public all top methods for availeble from instance.
      pub type #, "#{type}!", "#{type}?"
    end
  end


  module Vars
    # INFO: Variables.
    @@output ||= []
    @@fnargs ||= []
    @@fields ||= {}
    @@allvar ||= {}
    @@contex ||= :none
    @@itvars ||= self.class_variables + [:@@itvars]

    # INFO: Methods shortucts
    def output; @@output; end
    def fnargs; @@fnargs; end
    def instav; allvar[:instance]; end
    def classv; allvar[:class]   ; end
    def localv; allvar[:local]   ; end
    def allvar; @@allvar[name.to_sym] ||= { :instance => {}, :class => {}, :local => {} }; end
    def atypes; Types.constants.map { |cls| [cls, Types.const_get(cls).superclass] }.to_h; end

    def fields; @@fields[name.to_sym] ||= {require:[], passive:[]}; end
    def require_fields; fields[:require] ||= []; end
    def passive_fields; fields[:passive] ||= []; end
    def allover_fields; fields.values.flatten; end

    # INFO: Method devllgo run method of called class (default main method).
    def devllgo method_name=:main; eval "#{name}.#{method_name}"; end

    # INFO: Intialized in class variables.
    def allvar_ruby iself:self
      { 
        :local    => iself.send(:local_variables).lazy.filter { |el| !Devll.send(:local_variables).include? el },
        :instance => iself.instance_variables.lazy,
        :class    => (
          case iself when Class then iself else iself.class end
        ).class_variables.lazy.filter { |el| !Devll.class_variables.include? el }
      }
    end

    # INFO:
    # Last intialized in class variable.
    # If change count in context, then return last var from the context.
    # Else then return nil (without «.then» will return hash «allvar_ruby»)
    def last_var iself:self
      allvar_ruby(iself:iself).each {
        |k, v| return allvar_ruby(iself:iself)[k].to_a.last if v.to_a.size > allvar[k].size
      }.then { nil }
    end

    # INFO: Let. Create variable.
    def let var, value, type=nil, iself:self
      # INFO: Devll can't create something from nothing.
      return nil if var.nil?

      # INFO: Reduce context via prefix var (using RegExp).
      cntx = case var 
            when /^@@/ then :class
            when /^@/  then :instance
            else :local
            end

      # INFO: Reduce type find context var in:
      #       1. allvar (it's all yet save variables of current class);
      #       2. iself  (ruby intialize variables of current class or instance of class);
      #       3. otherwise get value.class as type.
      type ||= allvar[cntx][var]&.class || iself.send("#{cntx}_variable_get", var)&.class || value.class 

      # WARN: PANIC If types not equality.
      unless value.class == type
        panic DAMN::BreakTypes, "Expected «#{type}» for «#{var}», but get «#{value.class}»" 
      end

      # INFO: if all successfully, then set value for var and saved it in allvar.
      iself.send "#{cntx}_variable_set", var, allvar[cntx][var] = value
    end

    # INFO: Added fields (require and passive).
    # It using in initialize for create methods like: «#{Type}! val» or «#{Type}? val».
    def fields_append type, value, fields=require_fields, iself:self, &block
      var = last_var(iself:iself) # INFO: Last_var it's big func. Better save the result.

      # WARN: PANIC If fields exist.
      if allover_fields.include? var 
        panic "Fields «#{var}» exist"
      end

      # INFO: if variable successfully initialize, then append to fields.
      fields.append var unless send("#{type}", value, iself:self).nil?
    end

    # INFO: Intitalize — here main action
    def initialize *args, iself:self, **kargs 
      # INFO: Reduce counts of require_fields and recived arguments
      reqslen = require_fields.size
      argslen = args.size + kargs.keys.intersection(require_fields).size

      # WARN: PANIC If counts of require_fields not equal with counts of recived arguments
      unless argslen == reqslen
        panic DAMN::BreaksArgs, "Except #{reqslen} args, but get #{argslen}"
      end

      # INFO: Init variables from fields
      args.each_with_index { |v, i| let allover_fields[i], v, nil }
      kargs.each           { |k, v| let k, v, nil }

      self.instance_methods(false).each do |method_name| # INFO: Init variables from fields
        meth = iself.method(method_name).dup             # INFO: Save super method.

        pp meth.arity
        self.define_method method_name do |*args|        # INFO: Override method.
          res = meth.to_proc.yield *args                 # INFO: Call super method.
          iself.instance_variables.each do |name|        # INFO: Each instance variable.
            let name, instance_variable_get(name), nil   # INFO: Check his type.
          end

          # INFO: Post method action.
          while !output.empty?; output.shift.each_slice(2) { |func, out| self.send("s_#{func}", *out) }; end
          while !defers.empty?; defers.shift.call; end
          res
        end
      end

      # INFO: Added variables in instance scope.
      allover_fields.each do |var|
        iself.instance_variable_set(var, allvar[:instance][var])
      end
    end
  end
 
  protected # INFO: Not forget about protect.
  
  extend Types
  extend Defer
  extend Panic
  extend Vars
  extend Pub

  pub *%i[ pub defer defers isel panic xxx xXx output let new_type fields_append initialize fnargs ]
  
  # INFO: Init standart Devll types for that class.
  atypes.each { |type, rb_type| new_type type, rb_type }
  Types.constants.each { |type| const_set(type, Types.const_get(type)) }
 
  # %i[ p pp puts ].each do |method_name|
  #   # INFO: New logic for output methods.
  #   Devll.define_singleton_method method_name do |*args, usesuper:false, iself:self, **kargs|
  #     usesuper ? super(*args.filter, **kargs) : output.append([method_name, args])
  #   end
  #
  #   # INFO: Shortcut for old logic of output methods.
  #   Devll.define_singleton_method "s_#{method_name}" do |*args, iself:self|
  #     self.send("#{method_name}", *args, usesuper:true)
  #   end
  #
  #   # INFO: Public overrided super method and shortuct of it.
  #   pub method_name, "s_#{method_name}"
  # end
end
