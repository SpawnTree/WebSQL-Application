PGDMP     6    5                x            pluto    11.5    12.0     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16386    pluto    DATABASE     w   CREATE DATABASE pluto WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_GB.UTF-8' LC_CTYPE = 'en_GB.UTF-8';
    DROP DATABASE pluto;
                avanthikameenakshi    false            �            1259    24579    teams    TABLE     �   CREATE TABLE public.teams (
    name character varying,
    id bigint NOT NULL,
    plan bigint,
    created_at timestamp without time zone DEFAULT now(),
    size character varying(255),
    magiclink character varying(255)
);
    DROP TABLE public.teams;
       public            postgres    false            �            1259    24577    organisations_id_seq    SEQUENCE     �   ALTER TABLE public.teams ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.organisations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    197            �            1259    24596    pricing    TABLE     !   CREATE TABLE public.pricing (
);
    DROP TABLE public.pricing;
       public            postgres    false            �            1259    24588    rooms    TABLE     �   CREATE TABLE public.rooms (
    created_at timestamp without time zone DEFAULT now(),
    id bigint NOT NULL,
    name character varying,
    updated_at timestamp without time zone DEFAULT now(),
    description character varying(255)
);
    DROP TABLE public.rooms;
       public            postgres    false            �            1259    24586    teams_id_seq    SEQUENCE     �   ALTER TABLE public.rooms ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.teams_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    199            �            1259    24601    users    TABLE     �  CREATE TABLE public.users (
    id bigint NOT NULL,
    username character varying,
    email character varying,
    "isAdmin" boolean DEFAULT false,
    "isSuperAdmin" boolean DEFAULT false,
    password character varying,
    teams bigint,
    created_at timestamp without time zone DEFAULT now(),
    rooms character varying,
    description character varying(255),
    city character varying(255),
    phone character varying(255),
    website character varying(255)
);
    DROP TABLE public.users;
       public            postgres    false            �            1259    24599    users_id_seq    SEQUENCE     �   ALTER TABLE public.users ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    202            �          0    24596    pricing 
   TABLE DATA                 public          postgres    false    200          �          0    24588    rooms 
   TABLE DATA                 public          postgres    false    199   +       �          0    24579    teams 
   TABLE DATA                 public          postgres    false    197   �       �          0    24601    users 
   TABLE DATA                 public          postgres    false    202   �       �           0    0    organisations_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.organisations_id_seq', 26, true);
          public          postgres    false    196            �           0    0    teams_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.teams_id_seq', 38, true);
          public          postgres    false    198            �           0    0    users_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.users_id_seq', 129, true);
          public          postgres    false    201            �   
   x���          �   �  x�՘Mo�8�����l��"�=e�`׻i�i��R�&]+kK������ˑǲ�\i#H ����4��_�?������~��n�jӢ��坳��n�
;Ae�q�T���kMQwEU~Dw_���gW��?�������ry��z�w�>$��lJ锥�#��K�a��	J��l��|_|�����o���
S����Fx�yWl����،`%��PD�q��~�u'@�p&��@�z�K����0����%��"��(O{Um�tM��M\�0�W����ɇ���@��$J<�ݿ�YU�@��O��z�oy��^U�΍��P�ʶ(�:XѼ��s��,m��Ϯ[���̻�{>7r��y���yXN�<�o��vg�1���[�!{�y�=CKb`���z���ק�.R#SLU����q����颪��Mf�?<L�)�`�6/��Ӷ�K�(�QD~F��M�DD�W��&
����ǟ���;Ҥmm�DDg�$&Js	������@5b?�&��KϹa���������.��H�,-(��Sadf�T�_B[M鶨sm�:Op��8$� /i1Da��)�!_�B9���֭�yt�U�x�i�y&!����C����� �����TI-�v��6x��T1��4TN��vڏEN�c(tG��{`J�4�i�=� ~�m�@*Gar�HpWI��ra�5�0T��i��G�R���7�1����2Ľ~=^�S��*�  6�c�j�1��2L�r"���~wm]���m*4�aȾ�ڨ������2MU��4h��1o�,�y��d8ͤ ���_��7pCu�:��e��dFR�3M9l�w�>������F7mO���	����ٟ�Q�T�kv+�8�A��+"� 3�	��(�_
۟�m�������&��      �   �  x�͖A��0����ޘI���"���Cf�8N"��s��jU(��+�~Z��N�\�i�KI�'�ۏ��(K���&o���>w%�e*Z2����V6�o���M�ު��.�|ë�#x�&�q���^@6�&�+�>ߓӚ�kr�R�m�ΰl��ia�"! Ø��Gn =���}8<��?z�0���ݩ�">+ڶGU�릉�T��h�}S�N�;�-S���N�2V��x`�Ͽh���<�Zƾ�V�����y!�*�����6#h��B����.J��.�T46^�,9Ր�L�˜u:03�g�����2^s�W#0ٚ��M��z�؀Q���]��Q�66_�b�,��fD�1t vQ��>�a�"H��YݮC�us̢QC/�c!��A%k$��H!�3{WaQ�G.��/�3�f��2F1��8��˨��$��G�z��G��'���i=���ӟ놴�f'�s�5�JL�E��G���?h����J�����5���      �      x��]Ys�J�~�_AL��D�)kI�����l�_nR��h-,��7�6�>w���hh7n7�#+��r���k���}o�ϭ���-�D,�r����~�S���1�r�W��<*���.�&+���Q�B���Q/���BFcf�/��� ��lY!_�<���<�Ï9���f��?s�I���z�k���Q����:�Z�y����+wS�}�������%ˢi9ܧ�
<b���9u#��Oo��?�(�\�S��TԜ�ީ�]A'zQ�4�����So>����������`���c�/i�˘O� � ���\��^0�߉Ä?�������?z�`צ�x �=֙�m}��7�c���5�����Z5/Qc̫�s�#���e%��wr�NR�$몡a��<���xJ�w"�<4x��0���(���6~���l��7c���Fg�\����To=W��?��3~q^�V0x�Y~4Ú�������yû�HJʟr!'���]�H���j�n(9/@~�8� ���X<M��"�&Vy��.��u���y�t&l��ù5�y��}�������	_���U����~�a>���E�|�\��1Z*�p;�������v�����գ����z!h���u��+6�	 �ܜ8�S��;U%��u%���*�nR;�=�\��""��[!�M�Ϝ�C#�I�'���VpT�d��<{�ҙQ�!��8����9)��_��k({qy��d����"[]�}Ҩ秊z��5FK^�V�춂�ej|�ƿ��|��(59��W9�_x����1�����/av��NT'��|�
�QUgSW�� ��ȡ%�q?b���������Co�}�t	�V�(ȅO4OD:�?0e��<�;r [�Ѫ�Һ��wV׮�O/m�ҋ���e��Y��b��m1q��❤E5�ZFc�q ��&>E:����m�q!��j���Q�������d�C�m�;�[=���o�1���5)m�\��"�I0m���Y�\Gć1��>�Hr� ����9syd֓�b�g�oF�<D7]��B&�.�Nb�(7!�2�ȡ[�S��Z��x4�@��G^`f'W�p":�enn@r� _]����G\�H\jn7�W4��C6l�*y���o}W����l�-�q����o���&_E�7L��mE�
�+��jP��\��۰��+��^�s�x�����u9�����)�U�{��3��{��'��(�6%A��bw�j�!�Y�����a���L"�(��	�P/A�G���S�(�]���3{�+�\�e;��,ĻM���b�ht�1��Y�+���w�*��J,����{&i|4�+���EPk� g�Y��*V�����0�\-Di�Hؐ��e�EL�� ��"4��,���k���@x.��Jx��B4Y��lb���1���"	`�a,��B��o��0�ȉw�����v�)1�Q����9��%Q�3\��dJ#e!.���$WO�88�l̬�U��֜%Nc��Ŕlc�z�,��{kt�B�&��>���z� ����Vqf�ܔ�z�(�����qb�-�	!�<�#g�ͫ=��e��$�	R�b>��'i�B�a��#�uנBi��ɐ����Ro�����͔�6����J��0�B˦>g.ު��(A�T\�s���$�+XQ�Bv]�g@�R�@� ���H���W{���s$�܇En�Oh2�	���PD�R�@Ϲ6&�?MvEdE��4��4�*������ѺH$�X��L"�cx�A��x:t>O�K�D_At���K<g�"e�Â�<d{L#6��N�	أ��$j����kU�C�2��`>�j2��h�*>&q~�5���| `��C�/@h���|�FUt2LEP��]��,6�i��ֲ1+�B3�/��d�9��'��\�#�@P��*	�2�e��͋,NTX�%$2�8b^b�e����>Ճ6R�Fs�g��R��9z����ł�'�C��^�F���
mή��$17ѡl������Q΀!�d�\�2�.�+�I�I���J�-F���,��k�"s������.��G@n�ܢ�ސ{"���urQcM��BR��E�, ^�y����Ϥ�ue��&2A ��� (�h��gs�q♂���L�.� �ن�W,�n@�{�&91z`����E-Y˫�l֔q��f��O�����ot�� �s��ZY^��+��c'WE�<�q_D���Ŝ�廡.X'v7\����/ӳ���y�e,�����ďʹ?邰�q�t\q[������H��d��&�.��Z9I�|��]��t9D[�TϑC)Q�� �����V����d�����[���eȼh��4<��v�c�V,���*+����N�f?T�&�,�"�wlE'�%$3b�cI��]�r��J%��ۢ��fgi�;�I:n2��v0ֶ�#��ϑD�uN���Fs�L��t:mb���=�N�(����BFP���!
���5�������lÈr�0�S�6�9QǥŐ0�'Ѻ>1�g���d�e<1�X�0i&X)��i��uZ;�NN�����4x�4/}���6�(Y�+up׈&Ez#������b�.Z(3E{��<�`�2fr�b�R����xM+�i���E�U�A��HŐ�T� �NL�����z�g�(dz�		��C��q�A�D�5T�A'�b1���.}��&&~0� 4���K�aD�2��]3��v�g�S��tz��[�2ʕ�?�ŧF���#� -�u��y� �D-��M�W����I�C�k�5Ow �M���ita��6r�R�t�ؚb�f>�Wd���a�l�{������P�N�n����a�� S�w�uty�6�b�,�xa:��x�;>�4��/�~f�ts$���Ӟ7�ƴ��TB�"�_��qQ4yH= M�v����iY�$B�!�Ps�@��	h_`|].E��R`�H��6*�I�&���y��؟9Y$Q�C�_�T�����%�4
f<��Z�·86�:����T��&���G�"�8���X�,�␏���i��i:/�`hZ6AL����Tw6pY�6�4(���ۚ��9�LC)���%��R������L�ZCb�����6V��b������>�ή(#�T��l�����h�&��=�7���1����+���D�R���"G���h�J�8+7S�bW׃�^���(Z��Ŵ�ww��
��#�����	n.��Z«������l�W��,S:��QZ�j~T�a3-L�uHn&�M"顟�8�����c����?㨈����$6����6Y��d��Be81��Է1�ӡތ��0l�:0G1��ݿ������
�ʨ��5QܡT��qL>�6<�|�'����_�!D�RwYl9`q3
�΢���A���g�ri0�mp34����m�|K�?��4�\ ]��\���!���/���3�P�@�F�m�Dd#�^79�jE9Ms�O�k�V��d�fw��C�(�{�SԊ�vv��ρg��î5f�Kɶ��� 2kD�����f#s=��rQ>cJ��sS��
����Etq�k����da�N��$����a`>e8�e|E�M��-x�#�.��$"3V	�3h��}�c��L[�6�u�Ģ��c{�q��uQ����2@#��A�kW%�y�d�<�yQ�*��E��ӓ�����ա톤�z�Dꐅ����˯���>l9��6:��3�46���>�-Mr�!�)'���i�=<T��9r���X.��

;�fa
^z �!�*z���|�_�[�Mp���ܣ�=��ۧ;��J�z0��hY3t5�Xj�A��b��)��	f���Nq!���`Uo���q����2�P�;S����E��4��� �c��%:Ӡ��
��}K����B��o�+�3rH �  ��D������A�}4q�|��Ҟ�,(K�R�����sn���&A-3=_�0>qA~5�ȉ#x�c���3�����(r^p���\��O���ɺ�VW��|��]�x{��VM�����꾅֤PqV~�������՜��S�;� �"�l�EeqX�ڈ�����ٴڋH\z����0�ړ�?O�qgiզ���R����.'$,�c����o�V���J����l�������Ē�k�o���%�֜�j���j�ު���Y����`��m+Tۥd�5�9����t�/U�K�<\;꾟u/|��1����a�$:eL���q~w'��^ID�>U�Ҷi�n߬=+w{շ�o�=�u��sص;5O�B`�$�R�`Α��z���	�7/��.2V�@{����Y{�o�z�}?��n���w���!y{�H�@��9$�N�H^Ք�r��r��-�Ł�(�����l�O�~2�d����+T�%�n�	M}F��]o��^z[���
Mg9��u�N�x�[�O��gk�o_��Mg񼰟n���\[��i4ۑ]�a齆�0��.7�[2��lR�מ����C2�<�j�������<=6�Ӵ��#Ni&���?i!��cE���>���B�$zFc������j��sK.��� �^�U�v$?<Lú=����_��i)�u�8�N-cPޡ>�\t?#ƽfs�S��}*��������z�w���`�o��]'zל����^�Hw�NԼ�gk��"C�ON�oW�?6��#�>oƸ���{¬��=���ݪ{���_�r�Ӳ���q�|'DԻ�~�ϓb!/�S:=S�Ѽ�#ʩ8q�^*mcJ��ǭ�[��n�3��,�����F�J�o� 0�|77`����R8e�ʎaM�"�Ǐ\n���}��V9��-+֚�IR/5ZFދZ��7�=��h76Bm�$�@gߺ�B�N�H^���)�����AQ��/n�h��9پlgO�<,�Z�]�J�f>!c��Wz��B^���Q�3U����Sl<����5I��%<�B�N5��1���b���������R�J���$���l�o��g��O��t��!\��T*z$o�q\{�c�Z��"��D�X(fs���!������,�k��>,�Z2
�H8Jl�3E{�sZo,k=ψ^����P��]^"ECQt�i9cH#�||$$~ s��x�g��AqP�;�K���۴0�5=���a��Vc���ˉ�M����F#�Q��
)��O0gL�I_�яm:I��n�@9��3s�ָ����\q
��\�n�Zu���F^o��w2lZCZ\P4��gl�?v*��ed�pc�q0T�4�gy{���
i���k�Y���sZ����C�Q��/��c� [�kRVS�i*�@���ܶ�s�XÒd�7�����$�W�v��^��ͻo�:���I��=RjJ�q�z.���~���,�Ʃ�c��a.����}�;����f~����9�^3ص�6��e�ufe[�v�����uG��n��ŤV�K�X���\�>D��4��$,ѹt7��y 	����T�T���F��?[ ��o�r\�#ʉ�i���y����)��jۈ^�Zm�,�6��b��H�Z��ky-n���t���U���}p�P?��<z~����l�������T���h�Cא�U�e�~�ڻ�����׫A�PgŁq���[�m��:Pjꗼ��:��Seb�UR~ �����/	�     