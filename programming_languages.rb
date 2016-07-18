require "pry"

def reformat_languages(languages)
  new_hash = {}

  languages.each do |style, data|
  	data.each do |name, info|
  		languages[style][name][:style] = []
  		languages[style][name][:style] << style
  	end
  end

	new_hash = languages.fetch(:oo).merge(languages.fetch(:functional)) do |key, oldval, newval|
			oldval.merge!(newval) do |k, o, n|
				if o == n
					o
				else
					(o << n).flatten!
				end
			end
		end
	
#  languages.each do |style, data|
#  	data.each do |name, info|
#  		new_hash[name] = info
#  	end
#  end

  new_hash
end

languages = {
  :oo => {
    :ruby => {
      :type => "interpreted"
    },
    :javascript => {
      :type => "interpreted"
    },
    :python => {
      :type => "interpreted"
    },
    :java => {
      :type => "compiled"
    }
  },
  :functional => {
    :clojure => {
      :type => "compiled"
    },
    :erlang => {
      :type => "compiled"
    },
    :scala => {
      :type => "compiled"
    },
    :javascript => {
      :type => "interpreted"
    }
 
  }
}

reformat_languages(languages)