module Arext
  module Validations
    module ClassMethods
      VALID_PROTOCOLS = "(http|https):\/\/"
      VALID_HOST = "[a-z0-9]+([\-\.]{1}[a-z0-9]+)*"
      VALID_IP = "[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}"
      VALID_TLD = "[a-z]{2,5}"
      VALID_PORT = "(:[0-9]{1,5})?"
      
      def validates_url(attribute)
        validates_format_of(attribute, :with => /^#{VALID_PROTOCOLS}(#{VALID_HOST}\.#{VALID_TLD}|#{VALID_IP})#{VALID_PORT}(\/.*)?$/ix)
      end
      
      def validates_host(attribute)
        validates_format_of(attribute, :with => /^(#{VALID_HOST}\.#{VALID_TLD}|#{VALID_IP})$/)
      end
      
      
      def validates_constraints(*attrs)
        attrs = column_names if attrs.blank?
        attrs.each do |attr|
          attribute_name = attr.to_s
          col = columns_hash[attribute_name]
          raise ArgumentError.new("Attribute #{attribute_name} is unknown for #{name}") unless col
          
          if (col.name != primary_key) # don't touch id
            # length checks
            if col.text? && (not col.limit.blank?)
              validates_length_of(attribute_name, :maximum => col.limit, :allow_nil => true, :allow_blank => true)
              logger.debug("Added Validation for '#{attribute_name}' length to be maximum of #{col.limit}")
            elsif col.text?
              logger.debug("Did not find a limit for '#{attribute_name}' even though it's text")
            end

            # nil checks with validates_presence_of. skip boolean values
            if (not col.null) 
              case col.type
              when :boolean 
                # booleans can not be checked with presence_of
                validates_inclusion_of(attribute_name, :in => [true, false])
                logger.debug("Added Validation for inclusion of #{attribute_name} in [true, false] since null is not allowed")
              else
                validates_presence_of(attribute_name, :if => lambda {|item| item.send(col.name) != ''})
                logger.debug("Added Validation for presence of #{attribute_name} since null is not allowed")
              end
              
            end
          else
            logger.debug("Skip validates_constraints for ID column #{col.name}")
          end
        end
          
      end
        
    end
  end
end