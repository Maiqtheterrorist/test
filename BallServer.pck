GDPC                 @                                                                         P   res://.godot/exported/133200997/export-435f623093a3e2498450e744191b98a6-main.scn�            �s)Ĵ~�զr-��     T   res://.godot/exported/133200997/export-bf0cc3714134634671a63187f3102cec-mainGui.scn @      C      YC>?�f���+�4��q    ,   res://.godot/global_script_class_cache.cfg   &      �       ���-x�4kF�M��    D   res://.godot/imported/icon.svg-218a8f2b3041327d8a5756f3a245f83b.ctex�      �      �̛�*$q�*�́        res://.godot/uid_cache.bin  �*      `       G����aQU	W7b��|       res://gui/mainGui.gd        5      ����#xE�N���       res://gui/mainGui.tscn.remap@%      d       �{�B���je����b       res://icon.svg  �&      �      b�pW>���d���       res://icon.svg.import   p$      �       *<��Uh+?�E�       res://main/main.gd  �      0      alV�n!-v�K)���       res://main/main.tscn.remap  �%      a       O�|&�t��[C �tV       res://project.binary�*            �Zju����R!�Y�        res://scripts/scenesManager.gd  �      �       �Ͱ9���᫜�����    (   res://singletons/connectionManager.gd   �      a       ��+�`�������6�[        res://singletons/gameComms.gd                ь��m���o=�1�    $   res://singletons/serverManager.gd          h      V��C���&�d��        extends Control

var port: LineEdit
var max_clients: LineEdit

func _ready() -> void:
	get_gui_elements()
	
func get_gui_elements():
	port = get_parent().get_node_or_null("/root/Main/Gui/main/VBoxContainer3/HBoxContainer/VBoxContainer/HBoxContainer/port")
	max_clients = get_parent().get_node_or_null("/root/Main/Gui/main/VBoxContainer3/HBoxContainer/VBoxContainer/HBoxContainer/maxClients")

func _on_launch_server_pressed() -> void:
	if ServerManager.tryConnection:
		ServerManager.launch_server(int(port.text), int(max_clients.text))
		ServerManager.tryConnection = false


func _on_shutdown_server_pressed() -> void:
	ServerManager.shutdown_server()


func _on_map_option_menu_item_selected(_index: int) -> void:
	pass


func _on_mode_option_menu_item_selected(_index: int) -> void:
	pass
           RSRC                    PackedScene            ��������                                                  resource_local_to_scene    resource_name 	   _bundled    script       Script    res://gui/mainGui.gd ��������      local://PackedScene_bm37d          PackedScene          	         names "   -      main    layout_mode    anchors_preset    anchor_right    anchor_bottom    grow_horizontal    grow_vertical    script    metadata/_edit_lock_    Control    VBoxContainer3    offset_right    offset_bottom    VBoxContainer    statusLineEdit    size_flags_vertical    size_flags_stretch_ratio    tooltip_text    text 
   alignment 	   editable 	   LineEdit    HBoxContainer    VBoxContainer2    size_flags_horizontal 	   TextEdit 
   wrap_mode    port    placeholder_text    maxClients    launchServer    Button    shutdownServer 
   startGame    mapOptionMenu    OptionButton    modeOptionMenu    chatInputTextEdit 	   Control2    _on_launch_server_pressed    pressed    _on_shutdown_server_pressed "   _on_map_option_menu_item_selected    item_selected #   _on_mode_option_menu_item_selected    	   variants                        �?                           �D     "D   ��L=      Status: Offline       Offline                    Default Port: 2611       Default Max Clients: 4       Max Cliens: 4    #   Start the server on specified port       Launch Server
       Shutdown the server       Shutdown Server       Start Game       Choose Map    
   Pick Mode       node_count             nodes     �   ��������	       ����                                                                   
   ����                                      ����                         	      
                                ����                                       ����                                 ����                                             ����                           	   	   ����                                 ����                          ����                                                   ����                                                   ����                                       ����                                   !   ����                                #   "   ����                          #   $   ����                             %   ����                                 	   &   ����                          conn_count             conns     #          (   '                     (   )                     (   )                     +   *                     +   ,                    node_paths              editable_instances              version             RSRC             extends Node

@onready var mainGui : PackedScene = preload("res://gui/mainGui.tscn")
@onready var mainGuiContainer : Node = $Gui
@onready var mainMapsContainer : Node = $Map

func _ready() -> void:
	lauchRoutine()
	

func lauchRoutine():
	scenesManager.load_scenes(mainGui, mainGuiContainer)
RSRC                    PackedScene            ��������                                                  resource_local_to_scene    resource_name 	   _bundled    script       Script    res://main/main.gd ��������      local://PackedScene_k661f 
         PackedScene          	         names "         Main    script    Node    Gui    Map    Timer    process_callback 
   autostart    	   variants                                    node_count             nodes     "   ��������       ����                            ����                      ����                      ����                         conn_count              conns               node_paths              editable_instances              version             RSRC     extends Node

class_name scenesManager

static func load_scenes(scene : PackedScene, node : Node):
	var sceneInstance = scene.instantiate()
	node.add_child(sceneInstance)
              extends Node

func peer_connected(id):
	print(id)

func peer_disconnected(id):
	print(id)
               extends Node

  extends Node

var peer : ENetMultiplayerPeer = ENetMultiplayerPeer.new()
var statusLineEdit : LineEdit
var tryConnection : bool = true

func _ready() -> void:
	multiplayer.peer_connected.connect(ConnectionManager.peer_connected)
	multiplayer.peer_disconnected.connect(ConnectionManager.peer_disconnected)

func launch_server(port : int, maxClients : int) -> void:
	if port == 0:
		port = 2611
	if maxClients == 0:
		maxClients = 4
	if peer.create_server(port, maxClients) == OK:
		multiplayer.multiplayer_peer = peer
		set_gui_elements("Online")
	else:
		set_gui_elements("Offline")

func shutdown_server():
	tryConnection = true
	peer.close()
	set_gui_elements("Offline")

func set_gui_elements(status) -> void:
	statusLineEdit = get_node_or_null("/root/Main/Gui/main/VBoxContainer3/statusLineEdit") as LineEdit
	statusLineEdit.text = status
        GST2   �   �      ����               � �        �  RIFF�  WEBPVP8L�  /������!"2�H�$�n윦���z�x����դ�<����q����F��Z��?&,
ScI_L �;����In#Y��0�p~��Z��m[��N����R,��#"� )���d��mG�������ڶ�$�ʹ���۶�=���mϬm۶mc�9��z��T��7�m+�}�����v��ح�m�m������$$P�����එ#���=�]��SnA�VhE��*JG�
&����^x��&�+���2ε�L2�@��		��S�2A�/E���d"?���Dh�+Z�@:�Gk�FbWd�\�C�Ӷg�g�k��Vo��<c{��4�;M�,5��ٜ2�Ζ�yO�S����qZ0��s���r?I��ѷE{�4�Ζ�i� xK�U��F�Z�y�SL�)���旵�V[�-�1Z�-�1���z�Q�>�tH�0��:[RGň6�=KVv�X�6�L;�N\���J���/0u���_��U��]���ǫ)�9��������!�&�?W�VfY�2���༏��2kSi����1!��z+�F�j=�R�O�{�
ۇ�P-�������\����y;�[ ���lm�F2K�ޱ|��S��d)é�r�BTZ)e�� ��֩A�2�����X�X'�e1߬���p��-�-f�E�ˊU	^�����T�ZT�m�*a|	׫�:V���G�r+�/�T��@U�N׼�h�+	*�*sN1e�,e���nbJL<����"g=O��AL�WO!��߈Q���,ɉ'���lzJ���Q����t��9�F���A��g�B-����G�f|��x��5�'+��O��y��������F��2�����R�q�):VtI���/ʎ�UfěĲr'�g�g����5�t�ۛ�F���S�j1p�)�JD̻�ZR���Pq�r/jt�/sO�C�u����i�y�K�(Q��7őA�2���R�ͥ+lgzJ~��,eA��.���k�eQ�,l'Ɨ�2�,eaS��S�ԟe)��x��ood�d)����h��ZZ��`z�պ��;�Cr�rpi&��՜�Pf��+���:w��b�DUeZ��ڡ��iA>IN>���܋�b�O<�A���)�R�4��8+��k�Jpey��.���7ryc�!��M�a���v_��/�����'��t5`=��~	`�����p\�u����*>:|ٻ@�G�����wƝ�����K5�NZal������LH�]I'�^���+@q(�q2q+�g�}�o�����S߈:�R�݉C������?�1�.��
�ڈL�Fb%ħA ����Q���2�͍J]_�� A��Fb�����ݏ�4o��'2��F�  ڹ���W�L |����YK5�-�E�n�K�|�ɭvD=��p!V3gS��`�p|r�l	F�4�1{�V'&����|pj� ߫'ş�pdT�7`&�
�1g�����@D�˅ �x?)~83+	p �3W�w��j"�� '�J��CM�+ �Ĝ��"���4� ����nΟ	�0C���q'�&5.��z@�S1l5Z��]�~L�L"�"�VS��8w.����H�B|���K(�}
r%Vk$f�����8�ڹ���R�dϝx/@�_�k'�8���E���r��D���K�z3�^���Vw��ZEl%~�Vc���R� �Xk[�3��B��Ğ�Y��A`_��fa��D{������ @ ��dg�������Mƚ�R�`���s����>x=�����	`��s���H���/ū�R�U�g�r���/����n�;�SSup`�S��6��u���⟦;Z�AN3�|�oh�9f�Pg�����^��g�t����x��)Oq�Q�My55jF����t9����,�z�Z�����2��#�)���"�u���}'�*�>�����ǯ[����82һ�n���0�<v�ݑa}.+n��'����W:4TY�����P�ר���Cȫۿ�Ϗ��?����Ӣ�K�|y�@suyo�<�����{��x}~�����~�AN]�q�9ޝ�GG�����[�L}~�`�f%4�R!1�no���������v!�G����Qw��m���"F!9�vٿü�|j�����*��{Ew[Á��������u.+�<���awͮ�ӓ�Q �:�Vd�5*��p�ioaE��,�LjP��	a�/�˰!{g:���3`=`]�2��y`�"��N�N�p���� ��3�Z��䏔��9"�ʞ l�zP�G�ߙj��V�>���n�/��׷�G��[���\��T��Ͷh���ag?1��O��6{s{����!�1�Y�����91Qry��=����y=�ٮh;�����[�tDV5�chȃ��v�G ��T/'XX���~Q�7��+[�e��Ti@j��)��9��J�hJV�#�jk�A�1�^6���=<ԧg�B�*o�߯.��/�>W[M���I�o?V���s��|yu�xt��]�].��Yyx�w���`��C���pH��tu�w�J��#Ef�Y݆v�f5�e��8��=�٢�e��W��M9J�u�}]釧7k���:�o�����Ç����ս�r3W���7k���e�������ϛk��Ϳ�_��lu�۹�g�w��~�ߗ�/��ݩ�-�->�I�͒���A�	���ߥζ,�}�3�UbY?�Ӓ�7q�Db����>~8�]
� ^n׹�[�o���Z-�ǫ�N;U���E4=eȢ�vk��Z�Y�j���k�j1�/eȢK��J�9|�,UX65]W����lQ-�"`�C�.~8ek�{Xy���d��<��Gf�ō�E�Ӗ�T� �g��Y�*��.͊e��"�]�d������h��ڠ����c�qV�ǷN��6�z���kD�6�L;�N\���Y�����
�O�ʨ1*]a�SN�=	fH�JN�9%'�S<C:��:`�s��~��jKEU�#i����$�K�TQD���G0H�=�� �d�-Q�H�4�5��L�r?����}��B+��,Q�yO�H�jD�4d�����0*�]�	~�ӎ�.�"����%
��d$"5zxA:�U��H���H%jس{���kW��)�	8J��v�}�rK�F�@�t)FXu����G'.X�8�KH;���[             [remap]

importer="texture"
type="CompressedTexture2D"
uid="uid://cwubxtxv3sjwq"
path="res://.godot/imported/icon.svg-218a8f2b3041327d8a5756f3a245f83b.ctex"
metadata={
"vram_texture": false
}
                [remap]

path="res://.godot/exported/133200997/export-bf0cc3714134634671a63187f3102cec-mainGui.scn"
            [remap]

path="res://.godot/exported/133200997/export-435f623093a3e2498450e744191b98a6-main.scn"
               list=Array[Dictionary]([{
"base": &"Node",
"class": &"scenesManager",
"icon": "",
"language": &"GDScript",
"path": "res://scripts/scenesManager.gd"
}])
        <svg height="128" width="128" xmlns="http://www.w3.org/2000/svg"><rect x="2" y="2" width="124" height="124" rx="14" fill="#363d52" stroke="#212532" stroke-width="4"/><g transform="scale(.101) translate(122 122)"><g fill="#fff"><path d="M105 673v33q407 354 814 0v-33z"/><path fill="#478cbf" d="m105 673 152 14q12 1 15 14l4 67 132 10 8-61q2-11 15-15h162q13 4 15 15l8 61 132-10 4-67q3-13 15-14l152-14V427q30-39 56-81-35-59-83-108-43 20-82 47-40-37-88-64 7-51 8-102-59-28-123-42-26 43-46 89-49-7-98 0-20-46-46-89-64 14-123 42 1 51 8 102-48 27-88 64-39-27-82-47-48 49-83 108 26 42 56 81zm0 33v39c0 276 813 276 813 0v-39l-134 12-5 69q-2 10-14 13l-162 11q-12 0-16-11l-10-65H447l-10 65q-4 11-16 11l-162-11q-12-3-14-13l-5-69z"/><path d="M483 600c3 34 55 34 58 0v-86c-3-34-55-34-58 0z"/><circle cx="725" cy="526" r="90"/><circle cx="299" cy="526" r="90"/></g><g fill="#414042"><circle cx="307" cy="532" r="60"/><circle cx="717" cy="532" r="60"/></g></g></svg>
            ���#z��d   res://gui/mainGui.tscn���(�j   res://main/main.tscn������=X   res://icon.svgECFG      application/config/name      
   BallServer     application/run/main_scene         res://main/main.tscn   application/config/features$   "         4.2    Forward Plus       application/config/icon         res://icon.svg     autoload/ServerManager,      "   *res://singletons/serverManager.gd     autoload/ConnectionManager0      &   *res://singletons/connectionManager.gd     autoload/GameComms(         *res://singletons/gameComms.gd     display/window/stretch/mode         canvas_items    