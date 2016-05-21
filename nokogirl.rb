require 'rubygems'
require 'nokogiri'  

class Parser
	def get_page
		@page = Nokogiri::HTML(open("doc/RsA.html"))
		return @page
	end

	def get_class
		return @page.css("h1#class-RsA").text
	end
 
	def get_attribute_info
		@attributes = @page.css("div.method-detail").css("div.attribute-method-heading").css("span.method-name")
		@attributes.each{|attribute| puts "#{attribute.text}"}
	end

	def get_public_methods
		@public_methods = @page.css("section#public-instance-5Buntitled-5D-method-details").css("span.method-name")
		@public_methods.each{|link| puts "#{link.text}"}
	end

	def get_private_methods
		@private_methods = @page.css("section#private-instance-5Buntitled-5D-method-details").css("span.method-name")
		@private_methods.each{|link| puts "#{link.text}"}
	end

	def get_protected_methods
		@protected_methods = @page.css("section#protected-instance-5Buntitled-5D-method-details").css("span.method-name")
		@protected_methods.each{|link| puts "#{link.text}"}
	end

	def get_xml_file
		@xml = Nokogiri::XML::Builder.new do |xml| 
		    xml.body do
		    	xml.path @page.css("span.ruby-constant")[0].text + ".html"
		    	xml.Class do
		    		xml.access_modifier "public"
		    		xml.scope "instance"
		    		xml.name get_class
		    		@attributes.each do |attribute|
		    			xml.field do
		    				xml.access_modifier "public"
		    				xml.scope "instance"
		    				xml.type "Object"
		    				xml.name do
		    					xml.text(attribute.text)
		    				end
		    			end
		    		end
					
					@public_methods.each do |pub| 
		    			xml.Method do
		    			 	xml.access_modifier "Public"
		    			 	xml.scope "instance"
		    			 	xml.type "Object"
		    				xml.Method do 
		    					xml.text(pub.text) 
		    				end
		    			end
		    		end
		    		@private_methods.each do |pri| 
		    			xml.Method do
		    			 	xml.access_modifier "Private"
		    			 	xml.scope "instance"
		    			 	xml.type "Object"
		    				xml.Method do 
		    					xml.text(pri.text) 
		    				end
		    			end
		    		end
		    		@protected_methods.each do |pri| 
		    			xml.Method do
		    			 	xml.access_modifier "Protected"
		    			 	xml.scope "instance"
		    			 	xml.type "Object"
		    				xml.Method do 
		    					xml.text(pri.text) 
		    				end
		    			end
		    		end
		    	end
		    	
		    end
		end
		puts @xml.to_xml
	end

	def write_xml_file
		File.open("fatmodel.txt", 'w') do |file| 
			file.write(@xml)
		end
	end


end

test = Parser.new
test.get_page
test.get_public_methods
test.get_private_methods
test.get_protected_methods
test.get_attribute_info
test.get_xml_file
test.write_xml_file