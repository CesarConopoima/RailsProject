# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20141028012517) do

  create_table "carts", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "line_items", :force => true do |t|
    t.integer  "producto_id"
    t.integer  "cart_id"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
    t.integer  "quantity",    :default => 1
    t.integer  "order_id"
  end

  create_table "orders", :force => true do |t|
    t.string   "nombre"
    t.text     "direccion"
    t.string   "email"
    t.string   "tipoPago"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.text     "empresa"
    t.string   "telefono"
    t.text     "direccion2"
    t.string   "telefono2"
    t.string   "tipoenvio"
    t.string   "localidadvenezuela"
    t.integer  "userid"
    t.string   "status"
    t.string   "banco"
    t.string   "numerodepago"
    t.string   "monto"
    t.date     "fechadepago"
  end

  create_table "productos", :force => true do |t|
    t.string   "nombre"
    t.string   "codigo"
    t.string   "marca"
    t.integer  "cantidad"
    t.decimal  "precio"
    t.string   "imageurl"
    t.string   "modelo"
    t.datetime "created_at",                                    :null => false
    t.datetime "updated_at",                                    :null => false
    t.string   "imagenagregada_file_name"
    t.string   "imagenagregada_content_type"
    t.integer  "imagenagregada_file_size"
    t.datetime "imagenagregada_updated_at"
    t.string   "flag1",                       :default => "no"
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "roles_users", :id => false, :force => true do |t|
    t.integer "role_id"
    t.integer "user_id"
  end

  create_table "simple_captcha_data", :force => true do |t|
    t.string   "key",        :limit => 40
    t.string   "value",      :limit => 6
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  add_index "simple_captcha_data", ["key"], :name => "idx_key"

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "nombre"
    t.string   "apellido"
    t.string   "nombreEmpresa"
    t.string   "rifEmpresa"
    t.text     "direccion"
    t.string   "codigoPostal"
    t.string   "estado"
    t.string   "telefono"
    t.string   "localidadVenezuela"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "usuarios", :force => true do |t|
    t.string   "nombre"
    t.string   "password_digest"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

end
