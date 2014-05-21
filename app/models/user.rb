class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  VENEZUELA_ESTADOS = [ "Anzoategui","Amazonas","Apure","Aragua","Barinas","Bolivar","Carabobo","Cojedes","Delta Amacuro","Distrito Capital","Falcon","Guarico","Lara","Merida","Miranda","Monagas","Nueva Esparta","Portuguesa","Tachira","Trujillo","Vargas","Yaracuy","Zulia"]
  before_save :setup_role
  has_and_belongs_to_many :roles
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email,:presence => { :message => "Este campo debe ser llenado" },format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :nombre,:telefono,:localidadVenezuela,:apellido,
  :nombreEmpresa,:rifEmpresa,:direccion,
  :codigoPostal, :presence => { :message => "Este campo debe ser llenado" }
  validates :localidadVenezuela, inclusion: VENEZUELA_ESTADOS
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :estado,:telefono,:localidadVenezuela,
  :apellido,:nombreEmpresa,:rifEmpresa,:direccion,:codigoPostal,
  :nombre, :role_ids, :email, :password, :password_confirmation, 
  :remember_me
 

  	def role?(role)
      return !!self.roles.find_by_name(role.to_s.camelize)
  	end

  # Default role is "Robber" , Registeres is 1, Admin is 3
  	def setup_role 
    	if self.role_ids.empty?     
      	self.role_ids = [2] 
    	end
  	end
end
