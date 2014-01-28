class Usuario < ActiveRecord::Base
	validates :nombre, presence: true, uniqueness: true
	has_secure_password
	after_destroy :ensure_an_admin_remains
	private 
	def ensure_an_admin_remains
		if Usuario.count.zero?
			raise "No se puede borrar el ultimo usuario"
		end
	end
end
