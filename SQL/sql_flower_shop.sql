PGDMP                         {            FlowerShopDB    15.1    15.1 ,    6           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            7           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            8           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            9           1262    41880    FlowerShopDB    DATABASE     �   CREATE DATABASE "FlowerShopDB" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';
    DROP DATABASE "FlowerShopDB";
                postgres    false            �            1259    41881    Bucket    TABLE     r   CREATE TABLE public."Bucket" (
    id integer NOT NULL,
    creation_date timestamp(6) with time zone NOT NULL
);
    DROP TABLE public."Bucket";
       public         heap    postgres    false            �            1259    41884    Bucket_id_seq    SEQUENCE     �   ALTER TABLE public."Bucket" ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Bucket_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    214            �            1259    41885    Color    TABLE     ^   CREATE TABLE public."Color" (
    id integer NOT NULL,
    name character varying NOT NULL
);
    DROP TABLE public."Color";
       public         heap    postgres    false            �            1259    41890    Color_id_seq    SEQUENCE     �   ALTER TABLE public."Color" ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Color_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    216            �            1259    41891    Flower    TABLE       CREATE TABLE public."Flower" (
    id integer NOT NULL,
    name character varying,
    price integer,
    type_id integer NOT NULL,
    color_id integer,
    image bytea DEFAULT pg_read_binary_file('D:\image.png'::text),
    bucket_id integer,
    order_id integer
);
    DROP TABLE public."Flower";
       public         heap    postgres    false            �            1259    41898    Flower_id_seq    SEQUENCE     �   ALTER TABLE public."Flower" ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Flower_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    218            �            1259    41899    Order    TABLE     �   CREATE TABLE public."Order" (
    id integer NOT NULL,
    bucket_id integer NOT NULL,
    total_price integer,
    creation_date timestamp(6) with time zone
);
    DROP TABLE public."Order";
       public         heap    postgres    false            �            1259    41902    Order_id_seq    SEQUENCE     �   ALTER TABLE public."Order" ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Order_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    220            �            1259    41903    Role    TABLE     T   CREATE TABLE public."Role" (
    id integer NOT NULL,
    name character varying
);
    DROP TABLE public."Role";
       public         heap    postgres    false            �            1259    41908    Role_id_seq    SEQUENCE     �   ALTER TABLE public."Role" ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Role_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    222            �            1259    41913    Type    TABLE     b   CREATE TABLE public."Type" (
    id integer NOT NULL,
    name character varying(200) NOT NULL
);
    DROP TABLE public."Type";
       public         heap    postgres    false            �            1259    41916    Type_id_seq    SEQUENCE     �   ALTER TABLE public."Type" ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Type_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    224            �            1259    41917    User    TABLE     �   CREATE TABLE public."User" (
    id integer NOT NULL,
    login character varying(100) NOT NULL,
    password character varying(400) NOT NULL,
    email character varying(300),
    role_id integer DEFAULT 2 NOT NULL,
    fullname character varying
);
    DROP TABLE public."User";
       public         heap    postgres    false            '          0    41881    Bucket 
   TABLE DATA           5   COPY public."Bucket" (id, creation_date) FROM stdin;
    public          postgres    false    214   �0       )          0    41885    Color 
   TABLE DATA           +   COPY public."Color" (id, name) FROM stdin;
    public          postgres    false    216   41       +          0    41891    Flower 
   TABLE DATA           b   COPY public."Flower" (id, name, price, type_id, color_id, image, bucket_id, order_id) FROM stdin;
    public          postgres    false    218   �1       -          0    41899    Order 
   TABLE DATA           L   COPY public."Order" (id, bucket_id, total_price, creation_date) FROM stdin;
    public          postgres    false    220   �      /          0    41903    Role 
   TABLE DATA           *   COPY public."Role" (id, name) FROM stdin;
    public          postgres    false    222   Z      1          0    41913    Type 
   TABLE DATA           *   COPY public."Type" (id, name) FROM stdin;
    public          postgres    false    224   �      3          0    41917    User 
   TABLE DATA           O   COPY public."User" (id, login, password, email, role_id, fullname) FROM stdin;
    public          postgres    false    226   �      :           0    0    Bucket_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public."Bucket_id_seq"', 16, true);
          public          postgres    false    215            ;           0    0    Color_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public."Color_id_seq"', 7, true);
          public          postgres    false    217            <           0    0    Flower_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public."Flower_id_seq"', 30, true);
          public          postgres    false    219            =           0    0    Order_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public."Order_id_seq"', 18, true);
          public          postgres    false    221            >           0    0    Role_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public."Role_id_seq"', 2, true);
          public          postgres    false    223            ?           0    0    Type_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public."Type_id_seq"', 2, true);
          public          postgres    false    225            �           2606    41943    Bucket BucketFlower_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public."Bucket"
    ADD CONSTRAINT "BucketFlower_pkey" PRIMARY KEY (id);
 F   ALTER TABLE ONLY public."Bucket" DROP CONSTRAINT "BucketFlower_pkey";
       public            postgres    false    214            �           2606    41945    Color Color_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public."Color"
    ADD CONSTRAINT "Color_pkey" PRIMARY KEY (id);
 >   ALTER TABLE ONLY public."Color" DROP CONSTRAINT "Color_pkey";
       public            postgres    false    216            �           2606    41947    Flower Flower_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public."Flower"
    ADD CONSTRAINT "Flower_pkey" PRIMARY KEY (id);
 @   ALTER TABLE ONLY public."Flower" DROP CONSTRAINT "Flower_pkey";
       public            postgres    false    218            �           2606    41949    Order Order_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public."Order"
    ADD CONSTRAINT "Order_pkey" PRIMARY KEY (id);
 >   ALTER TABLE ONLY public."Order" DROP CONSTRAINT "Order_pkey";
       public            postgres    false    220            �           2606    41951    Role Role_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public."Role"
    ADD CONSTRAINT "Role_pkey" PRIMARY KEY (id);
 <   ALTER TABLE ONLY public."Role" DROP CONSTRAINT "Role_pkey";
       public            postgres    false    222            �           2606    41955    Type Type_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public."Type"
    ADD CONSTRAINT "Type_pkey" PRIMARY KEY (id);
 <   ALTER TABLE ONLY public."Type" DROP CONSTRAINT "Type_pkey";
       public            postgres    false    224            �           2606    41957    User User_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "User_pkey" PRIMARY KEY (id);
 <   ALTER TABLE ONLY public."User" DROP CONSTRAINT "User_pkey";
       public            postgres    false    226            �           2606    41958    Flower fk_flower_bucket    FK CONSTRAINT     �   ALTER TABLE ONLY public."Flower"
    ADD CONSTRAINT fk_flower_bucket FOREIGN KEY (bucket_id) REFERENCES public."Bucket"(id) NOT VALID;
 C   ALTER TABLE ONLY public."Flower" DROP CONSTRAINT fk_flower_bucket;
       public          postgres    false    218    214    3205            �           2606    41963    Flower fk_flower_color    FK CONSTRAINT     �   ALTER TABLE ONLY public."Flower"
    ADD CONSTRAINT fk_flower_color FOREIGN KEY (color_id) REFERENCES public."Color"(id) ON UPDATE CASCADE NOT VALID;
 B   ALTER TABLE ONLY public."Flower" DROP CONSTRAINT fk_flower_color;
       public          postgres    false    3207    216    218            �           2606    42005    Flower fk_flower_order    FK CONSTRAINT     �   ALTER TABLE ONLY public."Flower"
    ADD CONSTRAINT fk_flower_order FOREIGN KEY (order_id) REFERENCES public."Order"(id) NOT VALID;
 B   ALTER TABLE ONLY public."Flower" DROP CONSTRAINT fk_flower_order;
       public          postgres    false    3211    220    218            �           2606    41973    Flower fk_flower_type    FK CONSTRAINT     �   ALTER TABLE ONLY public."Flower"
    ADD CONSTRAINT fk_flower_type FOREIGN KEY (type_id) REFERENCES public."Type"(id) ON UPDATE CASCADE NOT VALID;
 A   ALTER TABLE ONLY public."Flower" DROP CONSTRAINT fk_flower_type;
       public          postgres    false    218    3215    224            �           2606    41978    Order fk_order_bucket    FK CONSTRAINT     �   ALTER TABLE ONLY public."Order"
    ADD CONSTRAINT fk_order_bucket FOREIGN KEY (bucket_id) REFERENCES public."Bucket"(id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 A   ALTER TABLE ONLY public."Order" DROP CONSTRAINT fk_order_bucket;
       public          postgres    false    214    3205    220            �           2606    41983    User fk_user_bucket    FK CONSTRAINT     �   ALTER TABLE ONLY public."User"
    ADD CONSTRAINT fk_user_bucket FOREIGN KEY (id) REFERENCES public."Bucket"(id) ON UPDATE CASCADE NOT VALID;
 ?   ALTER TABLE ONLY public."User" DROP CONSTRAINT fk_user_bucket;
       public          postgres    false    214    3205    226            �           2606    41988    User fk_user_role    FK CONSTRAINT     �   ALTER TABLE ONLY public."User"
    ADD CONSTRAINT fk_user_role FOREIGN KEY (role_id) REFERENCES public."Role"(id) ON UPDATE CASCADE NOT VALID;
 =   ALTER TABLE ONLY public."User" DROP CONSTRAINT fk_user_role;
       public          postgres    false    226    3213    222            '   ]   x�]�;�0њ�"=���:?����HR������(
4���T&�f�2޹�o�j�	�;�uބc���ƌ|����IJ�p�      )   `   x�-��	�@����X�	F&F��"x�Q�lG~V��7�P\�u�k9L$t,���C���K"�^j��0q����?d��æ|�+�Jc^�{F,      +      x��I��Ȗ]��l �e.�H4��nrN9��ro������	�b0�n��* r�sn��_���������������������������T�}�{\���g��ZJ9��
�?���*��������/����̟���}_y��R�y����5��{�]_W�k��	��ja�?�M������|�纞v?�}���s�w���'��cu�:F����̱g.��:����������,��콷������1��\�s�|�ە�Z��������ڿ����}����[-�
��������~�����?�\�q�5���E.3����8���Y+�;�s��Czw�;�����ךW�4�,��u�u���O	���kM��^jj��l�=�=���X���z���tG�N���	K�ޘf���ő���$��Ϝy����08�]O�n�W�-\���}�d�LB�s������[��z8o��O��1lN��͙7�����a<�?X�x���p0����
à��7�S���z�z��z[�����R���!延�T����9�S�|GO��5ʘ�N��w�+Wv�+�;���������w���#�+���H�O�8��9�k�;���oo��M�]����HT|rh�p�a��c��X_�������7ϲ�Q�w?�*�����r��G�b��͟?�zz/=�a�|�����X��w�L�+��
m��O[��ڑ��U�s�T.�*(����t�D�7m�w���_�\u���T�W��_���u����q;�-���v�K/o��y��6�=�Xx�w��u���G�r~�z�wF�;?�oV}8����L���n{ݼN�E{�4��̐�����aޫΨV���z_<�u����.o胬�_\7o��D�J_�˟�f�/"����X�\>�Z3��p_8��V�#ntv��OLG�+z���j�����xvd6Ŏ�_�]�݃����_oo]�yno(��?�^h�xО�q�G�'���mk�`�Qk�-m`�`�����ߔ�7�7dt�߹��������{(�J�(����������4�fܘ��O-���������s��~W@�ѭ�{�{#|u��A�K�J�7���S=w�5�����$���ys����:���<.��w�����q�X*w���{)�/��)n7vf�|kX��~3�V��&�k��x�҆��Y���\��0Y\<��d]�j!d<z�d���'OX�yE�6�g�[��ɬ�H����󻏭�8j�-׋׻�u�>{�7���ݹ]$c�7Nu` Ԙ�U��q����Ѯ���Xؒ�a��a=C�8���0W�v0wB�z���oN�X_�V��V����g�!�>�䏏=DN��)��$:�3/�9Y���#f��z���F�r�=A����Ŗ���R��;��~R1�S���q�T��ykA;�x��"�"j�[��-g��C�z�����=1ާp@ c�[�qJm���F�Ed^<���^�N!`���QG�?� qkv�/Ԃ���}���6n^�F�;q�3=o���>2�Ss�c ���~�qu~6�g����"A;�
l;�&�J7L��A�P^j<�����X���jq?Gr�:LO��t�"�;���#������|Z�y=!wR8�G��[.z̈́]+��q�<n�z����=/<������Nt6v$�r�ƣ�'ט_�B����`����r�]p����%A��g�7]ɻi��qk��XP���]_|�/�=�'S'�ڐ6����a�4� ����>;�l���M�/������yU(W��R��@�̗T,(މZab>sJ��^+r��q��8O�T����"������>�y^䳐�	l�s]��O����g�0&{�PS@�Li���M�,���Ox�Aӌ�j��:�LߏЧܽ��C0���]�9�����7��6%��C�U�8��/Y������xm,06������*&��щU�`��Ӎ���o\���a�y��o�<7�OvMOkGm �\�\Ӄ��50ZX� � �$d�G�ydԥ�e^ R��R�0��-��&`*��\ 7^z�#���s/�3�y㫰����(�A�#~���hR!�w�a}9ւH�!<�/��Pd��LA)�kֽ������{t���{�z��;�:&��Q��M�����umϨ�`��Dc�A>�Ov�đ���MG����QԓsyR��;�5ܙ���q~���k����
|~����� ���I�4�z=�O��������]�0o����d����G�����*�/��o�") fY�r�{�:N�{�p]3����i�[�ag�g	����9VA����N�1^�D�R��;�g��$v���°`���+�t����Q���ൌ;D�` 	��\�ˆ<G������ø�sn��;a�6����H�
H�r�p|.�<j�Ě틻�ᝁ[{\P���\C[���.	�0���� .��a���ډ����+�m�Ep�&���`�W�W&�@ ��7H �腯jOy��J����.��*e�>!��
z�=��ލ{�,P����z*R����;�'6�1mh<�w�j�a��� �6�0�`/COq���F`k���r��K.��B�e����)(4�@���; ��V�NXϺE{�C��0l��"�(����o`�|t^ �Oa/�e<�a�u0n�}!M7������(�e��=#��Z3�[��`�2�_�"懧��T�[�����ڐG*�&=F@@iA����/���/��艷���+���(D���(�NB}hT]���J�C�ל{���8<��5��F n��L����jCnv1ʸpΙ�����r�w�|���!s�֙g�y��B�ۧ����*�!���)@�0����e��bp�ç���󸋎�`�#��f�+��.�>��Y�!T�@7��ո1}+�T75Pd,;N�E9X]@z����tɆ�N�!Zx�q
�"+ɸX��׀���/R#��` D��nc�3!�o�;�'��zƤ�;��WZ �)y��V��u�F<������۹Ad����%��)���p��K.9�CmCx���U�*�J��g� G	mJ�+�Bķ�/�`���+0���!�=^7 ú5�)Fۛ����r?��֍����F���_CK��ÃA������<=FR���Ig@�
�!��`;��
Q�;�y2��9���W 8P��nO͚H䇷�I<���06� =R���H0Y�:����f�?�2��T~�D�3ыC���к�7X< ����'����j+m�S1���}�E��@&|�A�0���poIpEQ�F�+�u��+8�BP�E�L>��l�l��g �!�<j)ۜ��
!�|�L�.93/O�s� t�x�徼�atn_�܆mgI�b.�ͷ�S@kpw�γ���g�v<v]��^��`��_<��[�{�SE-:��?��9����x���`ps�Vn��pDS;�s�"�1��.�l����8��e�4�<��m��j�1��B�����׫�������#�}�!�: � �a�9�K���x4��9aw�b
�8[`T%�6,�X��8����Ƶ;����M��B�&��2F�yv>�`��O������\�}i�mha�������4��0�	�)˔Z� 8@;�
�o*��v�p�GE@;��B���v-�	�h%\*��������C��[E���V����b����1?񝌽�s#[�c� 0h����"����� �3<x���[�^�pL+ps`�Vv�\HP��EyoÅ�h���j�9/s�x��k�W?0�IC�����Au`�lخ��l^ ��Mݨ����2��=�z�GSj�.if�7��B��h    �Ӱ?:�[��=_·l#V
/�qH�Fa����J���a�gh�r<��?�A��Ą8��G p��_!D|@�P����h��z�x!��S�(�<�-p_���d%�cyB�ޙ�Or�W'A��4lV@CBX�E�f���}���5!�X>�:B;����'6a����t�$�ƳF��kXGt/�"��b�~OLqt��%oX�FȻQY�%���a3�`4NY��Qm��'��I1�/�l# �)�WX����-�\:x�#���q0�&��(Aݍ8��dpx)�D�"*�+0����ǁh;nS��y�q	Yo\�bA8Am �.�M��а�aF���c�Y�� LQe���b o�;fBc^]z�K����0����� ^~����|��������u4��@�k��:�؄%-XZ_''��X��/F��(v�_�@m��Mw��x���ro�L�75٩9���vv��0��x`9��q��}�1�W�C��)����#���e`90��:Y�.H�Vmz�� �4�'�ߙ/ƭB�y�?�M,7~�!IxQ�+� HF�c9�W=9��C�*�@;1�0� !L���a�L�'�7��F�� �q#�/'�8(f9����[���h��/�:�&2w>�2č�7�t�k��Y�U�j�m�~�60~4�1||݁OG�|���^D�<Nۯs�&��H�ƪ�Ɠ+���_��cc��k�N�@E4�-�,���U�����C�IPx���(��'�{�nm����n�\�
�2X �FTqiH��IN�� q�f��w�x�^�E`QY���	2�ߨ�ļx��V>r�<���xQlN ��ezsh������'��Mg��\)p,���P��zK�f��͑�G^�����Q[�l ����~8�,2�Y�#? 4�ӃJ'��Q}
�>��6��n0ڊ��x����a-���h�c��J_cj-x3٬,��x���?�>^i�/恿��EpZ4ޔH��z3��2x(��_���+�]��::�/A0_|#�2������ڐ��6+�1O5�Ņe}��;}ՎL�����Х��O�.��#x`�,�;[
�(�/�u=�c��]��"�G�d��nY 6vp8KPs���ƍrj�`�A��1�6X�<���ʪ��V�־�[�
���I��`�Ǜ1��a��J2��K���ď�#'��Ή/�HS!9����\k�@�H�x��5Ld7�8Pa��v!hyЪ;�����Ǝ�`]�|x�0ё�@5� �8�����*?�`�QSP4]��L �e9���4�ܾ��:�8H����QX��7�4)��	w�{��y�aƍ�6 �pi�o�	mG�@�A�z���a����a<�n|ċ,9�eI�2zAu�H#�`-,#�n�N.	s�?��OZ�A/��8:�dZӁ	���xs��h2^}L)&~�:<.�u�?EcS����dRf�/c��֨��}�C˜ ���Nh&��}��ĵv�ç��m4�9{��0u���Ӹќ�F�8߄�N�/�	E���|�j�J{'�˟����?�_�0���b�� _:%֯����]^�ԑ�s�&���)��lzf�VX.t�	�Zp�8�����D�Q�����A��;1q5�Ҹ爖F���������Rr�͠G���gpXI�P�
��E���߱����~т����[P���5�~�� ycn;$	�<a��*�90d�4��á¸C��.��_4C.�=9,������=U�4T,Z�k@�Q�\O5��<�9sn� �hbja�����ɋ���5\�k�?��$��0�}r��]\������C����?�^0�_���؍,e�9�c�'�.N�!n?���x����J��������ݔ@_��=��'{�P�9�����;���A�7"��=u+���9��gz��aطSP�3�4*C��)(
h9�a~���9���/�D0��$ް�aU����fS��r.]D�f!��Y4��e��X��s�g���ZFޑH��ZgS��o,��`�q,66}5i .��e�[�	B����Њ����P�4O����p�uo��� ���ec��� EÃ��ʌ_�G�`
�����B�=�F^�Dh��-s��1W�EDs#r9�0�N�oIg h/�eF��B���+��>8[sV<�:�l�kp]�:��]B��b 6~J��ב �Y]� 怃ʉ��2:7O����j'� |7#d��2"�<�@���|�m��/Q�x�o�� �#"7�U���*3�53V	�%<P��Jg\�^�@|��n��������5b�utX�g�ט�T��4��@	�#b9�s�ڗ���-�Wt!T  ���x�	�ڼc=�lX*���e�v W���7s�f�"d-[���x?w�|��,�6%���G*9��o�w��ƒw�R�b}����,�W=Ƌ��(��n��BK��D,�W��B�_y�V��ᔢ��3�.�s�Bk���*tM<\��!�6C�nM`��m��[¨�!�5Z���
�n�}��o+���-Pgm-:B��iV� rD֭8����$�E�X�u����7⍪1/3��Fj�1�
�2�'� �F5w9Q���v˚���;��T1t�vE7h֖#	�v�C����HO����	�����Z�KPz����f�P4��_+!���#d�߼�i�bf����pQ�ջ�M�I ���@kG�[B$��ˊX��}���:,��^� ̏�|�ѐ�\_��8���S�r��qM��M��5�<�<^�t�>WP
��@�9Y�����z�3 �av[���[��p�H�$��R�' ��Ư���S�'4��L�	V��� ���f����O�~��b��o6��GgAUp]È`d��W&P�v��V�!O�%��E�V�W�݌EU� �=,6^��L)@����$(�o�%B�֍�A���Vx�[3��#��Knc�h �eŌpJ��&ap�-m�ְL �8�q����6������,�|O�t��3hoA��&�N�R�@�N� �{�`K$s�7�Xi���g���H���a��A�o�^7*k���s`�މ�囇*�Ԍ�%/%�,{Ӎ~�Yr��dXm;�7/ (,i���k�OL��|��`݁)��*�8�[��}�o�F�V0���m2a��;�pC9��ɠ�x��A��\8���$�5N��٤'~`���v�=����~2~H�x2��93�4�K0�)���X�~/�r+��~q�����@���'�Nh3��H C�- �݀J ��D(\d��F����	����v����Oz"G�0N+[mre~,����f" ��6�t���,���+��a?�a�!�p��iޠ�h�ϯ��T�e,\"�w����;ʚ_�O޳�}���񂕏����n_Ć�b��e�;�
��u冁�C���6 v\��*wF��� 󜿷���D��X/}q
8�K��7�ź	u�Y��aL�)=�
\o0�������2��c�"��q<�Xn*�G�	�l���MEz (0��7�h1.�LxB�9��&�4s���h�Z��]�j�RYD D��f���?��^��V�?^��FlI4 s��x�q;��<�&��1*j�T�R��1��5	��V_r$�!���#��ť���'E�8%.=�R r)�̑��t^'�^��W_����
N�K~��mԃN[��,�0���_RW�3N����i��Ԋ=|V����
��
h�-A
�jO�%>.��qƠ=�|�2,No�!���m	3߃�G�9 \J��@L�ߍ���{VK���@�s��j���y�PH���h]{��kв���w���f�V;0U��x�:��f6󲾵~���Z���00��������������n��eF�_�_i��ۺ`�?�����4�dK�Q������D_�Z=<�    %]A��N�7��|�	�/�u�c^+'8��K�W�鲂��f	�1�<��@�׃pvt��T}�����w�7W�@hB�=*�V����ax���cI�u{��`��UC~��������T��j'
/bsP���5&��cm�|�s�/N-�<���El/��u|y���\���n{b���q(�OWޱQt����;T�^�I�n+a q��Ԍ�"��gH��U3Laj��j�n����Q�w<>�Y�Wb�ѣK��'����Oĉ�B@ ��~5��n��xw��.IY��Q?�G;�[��|=�eN`�a1�����W��üq<V�d9h�ub[�d2`��i�E$�|��:���s��꧃K�5c˛��)�Z�di�1�S��m�٪�'xH��!��1S�'�-tC&pm�#���={�W���a�DR^�����Tv��\�38��?���c�����BF߻��x��<�u+%S��m@�m$��ꏄ�G�W�%���:\�p�I��@_�q�H��F�2_�{r�+ඒ�h��r�I�1��+Z�?�\[�W���L`�[��ٞ/�Ù�	~D?��dn�ko�X�z�2��������ힶ��(���j[3)6��q�~t�s�i4���=s@Y�0Ŕ�E����C��c��e6q��47��6+8�E ��Q!����3�oJ�r7hަ�� ��}[��4���tF���v}=r>����Co&���"~׎�`z��&ɘ�E���;K48ojt+���iA�����؝�Q䋒ɧu����.���Q�O�LɶG��ln�~��y��"��1�uY��7�튖�b�����<�ݛ�o�����/�h�;l@�2q�e��^C�x�0&���a��sj��ݜ`�z::,�� ��رSL����GOϟc&���z�nY8--�h�)��Sz8�9[1��X�N�2�� @]:.�3�e�@"݊��9�R���ɶ�VƏ���f����� #@��������
'��*FJpG͒2X����<^@=�>��B�������4.r3��7	���i|?|h1���^�3+�����1��):�l�:��6V@�S7L�|�⟴��hۜ�˯�2����B���:cK^D�sy�2|��!�΃����vj���u�.�R�6㗻Ö��L!C�L���q�&{�1�Xs����w�bɥk��-�;U���E퟈߾D�����b����6M�vT�#Lv 9��R����/��קr׈�j|����0��mZ��O���o�R��c�ؾw�ʘv@}�m�Pk�{Yd�HP<���p���v7|��hi��r_��,H6[�ooOw��F��#���?��� 8�E���{�m���o�2��Y)���ڑ�,���!��c����z�V���!��nr��V+;��(��^~7���K�����7��h3�Ip�C�)�G���`�6dYl �Tmg��.z�����vK�"Y=�����
�e��Bx���p�pHk� ��i�p��<��k�|a��I�Z@c*��aY��n�m�a�L��
=��b�0�������+/"¿��b���5�R�]O�s;���C�1�co�8v�����h~�ɰ��^� 3�:�W@��<�N}�6��u�ad��ߪ�����_�W����7z�*[�Z����̢�v�D<[nP�Ƽ �_1.>#)�H *��3Ƒ�����u��x�=�B�R7 ���p��^\��Nrs#�\&��:��������F�X4iWNcL� ���t.L@|f���.z�mRA�j�=�	�'������� �#Ӫ�������~��Y1.a	�~�,��Ux*l��{x�iCO���f0>�k�(��U��$�����C���t���X���׬��RQ�%��3PA!m-��K��@��v�v��W���	�w:`ך��L�ԍ�T�P��iv��F���
QGgt�Y���OQm��<#�����Ϸ!��6���3������^nXC=s0��8>��?f�g�b1��οࢷ��B������7"O��,~X��`�/GR�e�w�C�gY�H d����H��vrA�%1�Ӟ��C�&Z�� �c��6Ǌ>�i�3)�oˊ��`�Ÿ��U�a�$����Zlo�]"�ړp���,�e��N�/�8�/�8�9 j��P"؃�#i��( 47N����{��j��Z8v�F_[�p��E��f����p�e[�-i>nֹ �LC�ĬiSO9�I���Ł'������*�x~w�W�ב�ɚ+��1�b=�q�`��-j�q�#�����{��$@l�Aذ����BS
cX���3���Ϫ"&� �����~��O�c�a[E�:b}�I˼@T<) ��`�ʌnP;~b
���]:H�'��ON�t���A����ڪ�-���^��<~�y=��v��.�`�/���x� a���c�����2
�|��V,��'�o�����pM0��419�(t��ˮ�Բ�Y��v�=d7�k:�_�k@z��3����f��^�u���<�=39��4Ju2�b����ΰ� gd����x�{n�\�Y^Q�
 �eÓ<�l�0 �sl��!@zEh��ea�q��%��Fg���>���dY=�R��ioENN�<8Ϛ�
�.��At�LP
���H��x��>p�sg�=J_�ֳ�i@Q3��w{�w{g��b���ߍ�}��HB���^`_���q5�vT��K����e��i�i�q�a��S�꿪��o�Зs��p��7% $[ug�	s�dK����rڀ�L���Z�[��<�i���$U�hj��B��γGS��C�.21g�T���-� pʏ�54�?�=��h9�6��j��@e����N�5H�g�j�xE�Ef@�)jze��^)Z�:ʒp�8LKU�m�`��k��)x/go��������I-�3r0$�0oL �_�I���Ǿ(�R�t�3X��|��VZn�6_�˧�n�p�����tR���X|���=��Ґe���Bx] �)���W1�\��2�Џ����\����"�$b���"[
;��Vׅ��G��Bn��n�*���k�4�z��8/���"�6�X� ��g�y`G�SF��1��RYh:n��3_˶�a��4i��QJ����o<p�����G�*�� #�͹�·2n�{�E1�*�%YkV� O���W�4P���u���z��b1��Q@�G��O�>bc6�V�h�@�B ���xN����큦9�jL�1fe���'99a��a5�UmA�TX?��� ��		_��:o�듨���'��K5��lη��m���a-gi���ks�Y�8�㛶5o�r�����Z�������E�r`9̢�����L�}@A{Z3e�Y���4�;��T�`�0-]�V/ H��U s Z���)ǐ�޵��wm�A�/{ N8n��<bǑ��q/�����S����]as��hߡs�,,��x�7߂�I_�A���3�O×�;�r��!�h�G��S�c���4��85����V��[����f��t�zk�cܘo�:�9);$�RA��X$n��KN��$��-rȧcq?M���?iTݳ�m�]LX�3{�tۼ��uV�n����82�L5�pmN���}��<Qہq�<�_�9^�v�qV%�^��!��gR�����k^0wU�9� l�YT������ܗ����w'^���9_��!OdH����6.�p�=q��u0["�|���nw���~'��R��E4��u6�5" �c���eGڈ�d����K�����i=Y��<�?p)���6��ǐ�n�����Sg��e8ݸtR�n�mT,;�"������\ֽ���.,i��g��\?��,��mY�(����(��_��\�Kl�I�Ñ<)6��� �i������GC�  ��r
?    �B���|�qf��W�4_�U�[����O��J�~u����y${aO��p�gP�gl��&�r´��N*�	�S��&/`�'58ƅ�3�+frE��/Gɜ���[Zy�w�cyϘL�S����9`t�1�ws��,��yۓ�`/�A��XYV�����F�l��B�`�}5�`�z~FB�L�O�A��6���z5�q&���K��/`�ufP��	_�e���3�~E���*��jX�כ�t�Ц��8R�p�dD#�u}��e�!߰��Lg0}=���i�<
�鮋����i�<9U�%���&z�w_-�P��! 7�{w��2L?O�ﾲ��B�{���y���jL��A�ؾ�Lc���:y��.'�rtfcӑ�>��,�F��Y��['�Δ-��Ζ���.�G�u[P��U+C�*����8yLR�` C�@�u
��������p�	�۔�k�*?�1�p�����bbh@7"|� ���&a�e�w�Q|�`	Ԋ�Q}m��P��7��{sb5Of��.?�����ŊA��q� ـL����#5g�-#��{y��l*۩��.g�-A���tt��c�P�+'JH�-���kN�Y����⬁�pD�u\�uf�E�O3چ�{DJ	:ԫ8}�[�!v�W��u�y4Ǩ_j�D��WP��o��-����>s@�]�{��0h��t$�l3�"�1�����r���M�ˎ&�d��_k�a>`�g'' �҇-q��R�VG�ܢ�������4�B_��<2�(�`%b4j��e4kM�����!�PXټ������}ك��5Y��&&��2v��iD9�Y#q[Μ�0'Z�®z|��G����)a�A��=���#�@���` ����h����s?	p�r��M�8� �뫼^5i/��_Τ���5!'s8��۱e-��w����5~�D�����7ۦR����H� �&L��,`Ϭʨ?����l�y��^>(�~F�77�9}[��|�K�����4�.}�:5Ƃ�e>���X#��h���&܆�tj��ee9��9��i8��q��F
�r��	T�2�i5q��LKF��+�|=�����E��2��d�������R̯.:�
���ևo������7�+�d�-^υ��I�bCںf����3{`�G;��1����2bA���"��m��ď'M�3��-�ܾ���6���k�)k���#V��آ<�r*|Tr���c<2Gx��t �z�+�bl,��tkO����39ϲ�m��q�.�:8�f+	��&M�Κ������9��38�x���o�	ΥͶ��G�����}���&36����텹A13;�˦H���K.D�#���d���,��g�Y�<6v*唄���Kv�.��_�$��R��jۻ����mآx���SM�0f����>ܼ'W��X�G �E����{� �/�	���Am[6&�%���t��%�-� �j�~���m��Ĵ6;�n��gI���r*�Q*}�Ql���~���X����Ό��8���<c�'�j��0���+6�9��6d��x���O,ƙi/��pn��f������Η��۱� �B�?��7eG��޿��[�\LW��fM�hAѮOޚ�:Y��L�@s�BO��a����fcD����O�Ý�A�1Z7��\�.ؽf��
~����K��J5����hd�\���f�����ǡ�HR=�Ǹ���Y�hC���8���m9�uFs.5T1�a�fQ�<�F��6�F���w��b�9A��a��T�>�:ek��}�_��8p���5��@��b;�^lq�$ް��v�v�����f΅� ����3F�X7nn����lS�~?Ӑ�!�c��}��Si���:c��O����s'g؟H�C��f�Q>}��~�D	�!(+�n�-�G��E�ث�7�e�N��[��',�|���y��������̠eYX�w8��|�����Sp�ⴻ�xt�|�mDP��ѩ a�O<}��(���ܚA�e��)�Д���f�_������y��S�d-훜f��11H��t�!p	%RJ�b���(h�-����v�	�Oi�S����g��c���0�7讵i�&�\�1�=�D��Vsv�~�g�]�z�V�^OP��m}�W��Aq���,sEܥm:k��(^�U���O�7R,g~-k�#���V�qc�Ph�`\'��F#���u��{r���Nh�s��h�J���.�nPȆ�࿎Crb�3S�^j��s�/N���?�U��`	"\���L'OLg�1�����y��#�`m��+39U�p\�����l�N]�8���	CK8��xu�Ƽ�R���f�C�6�;�(����גY�_��d�嶎���=�ѨV�3R +���C]\� ��_�cB쯛�3�������`��5�
�i�|q�����(�b�:�����l��=����;,�ON�Is��ΰ��P@��:����kr1g����w�OBZ�w�z���Q'K�ۗC�>�l�>d�(�*�0��k?�����2�57�����4h¯^����_|�gk|�h$;�10�����C��v���n
���.�ӿ�w5�ڨ�����"�I�\��PJYA�����&)�;�a��w��X����s:ϺYgS8��{[0��U����q܉��vf���,V�C�3�y}R�H�RO��Ol2����wV�wba��u�<���v1N���O6᮶���p��دh���8�?��߼�!����E��Z��{��H�,���C�� )�s3	��,������,��ʱ]�T	7�d��e�~��`��GD�ƖE;���:ac8���^�W�L�ZOh(�����,��]PȮ�eV���e[���o������d�����W!�k{{g
�*�v��èx��7��gz����(�3����������D%�m��G�l_�@.;��e���$D��?B�!��:6G���t���ЗQ����6��8�[�	����δ	��9 �J��ïFJ���'x����9����O�qB}���>�/�j%�a׶����Yn�g97��p�g���Lg��æ�ß�X���	2���Ԅ��2�b���9� �����=��~pE�G�2�����"^�┝�mu����/O-s�b����h�'��P���>{Nt�[G�u�����(�4omR�[]rg�d�ao�}1,���v���ɚ�ߙ�hT9UEw���V�P�b���R���j��l�rg�Y�fVv ����qa:���V&�����ˈ$vs�V0�'.�m�0��f�$����~X���^�e��L��p[����<"���]���p�Yg���sbΜ�s�&U�	�}j�n?5N6��ز���4c��R:��voA)��S���G�,9�?("�[?���L��#t��n�gz|*����x�p\U1��3��܊�����F(���ƾ���7K��ن~�EHK93�v��8�s��X����2B���T\�t2�����A8����m�X�+G7B]U�\��{Y+�����4�H��{�z<;dc�
��5\�;�>�p,��mK
���w��g�=���A��P	c�-����N��1Q،�#2,��ZkE��:Ѡ"Nv�������H�*��^k��>=$kN�[�p (��U"�E˼m�T�!�S��7=�jZ�ϝ~�y;h#�͎\����۹t]�o�1&O�����q%c}��N�Y��
]����#��G'�A�� b}��z+������O{��4�����M6 ��l�s�� ���)�(|8ɳka��"�����Y�~�3*4�ej��w�Z7O6�����=Op�0r� j�L�FG�n����>��8�.�rW&
b��,g�g_X��ti8�x�:����k��N�p�3S�3�X��;�Cm�#y�-�Z-j7nw
�!H)��h�Vq����$H�����ג�i-��&koq��uAâF�鲴�    �Ct]�s�q�̆.:vk�#C���U�<(��s���192�;k;3�`@Ӧ���D%�l~��Xk�$C~F�ʶ��h��:m{&y��'|��7��j5� ["U�zpf��"m��	'׸(%|�[�df�9ܪ������'������P�{��Β��LG��c��m���g��5�g��G�\d�E�.�0�D��T�V���p����3�@����U<!.	�vxY����%����j&#ᅟ�u��r���d�1�a%��ȓW���� L���kC�}�܈c�(�XПH��`,!8�4cL�؝���e �1�W;r����eU��4�C��uH,�{����z
�8�؟U�m�(KS��*xT[Ɵ���� 0ǅ�y���ߦ�,?N	���9���m�-;vL��'�o�p�q-��s�9��-s:�lb�Ӱ��][<�|�Si�k�P��I������7C��&��@(��e�o��~�L�\�c�Y/��n/���T��5�ohX��#ո�x�|��%� ��˹�b[ϩ����"*�݃{���k8")9�%m��t3Hpm)st�ș���߇��+�5����_v��)���u v=���y�(�j�QyR��Φ++�ƙ�l:����F���t�rbקc�1���]�J��˗�_o���T �?��X�C6��ѝ,j��Ʃt��tݱ�ү���w����,��˙*��4]��1=���U���3�y�)<S[�8!��,?;2�d?������+�ܺ�k�s��T;�k����;ʗ�\N�j��ꐹ��`�4拶ؔ���Nv�8�Te��	��ȶl�������q���ڲ�oG�zݕ�>]f�5�����q����Q���M��r�$!VD�P�i��v/׺q9��|����'�Os���g(Kq��:���q
��`�|Z@�.�b��x����@W<ba��IP��T�G��#ט�o�(r]r���K.��=sf�,�{����g�k�y��6Q�����*a�11j�]�[��]�1n��vƥ�+q��=�7��Ze{�3G�<�U"��s�?�h����2d����U������X�4^�SE毦������mS�D�Ū{�'����tt0L���~TO�=]�c�j���@��x������L�U�a5��<�97�f�y�]������fZ����Y�`Q�u�Κ��f��8�s��%T���2`��zh���&^��y;������iHU�z�O���wnr�Ή���*n���.v"���kY���|4lO��Z��Π������v�Y��qH7�6�}Vq�ǮY�y[����xf|̆�X�l�pqr5���|��xԖ'���W�5S�C}������%{��ەW���Zw��|�=�Gw��D0���f�<Kjܜ ���]��M�(T���4��p��,B�l}r�{r*T�S�!jy#�+I�W�a��]�Õ�nV���C�Ζ] �ſ|&���:�<�o��t�m��PQߜ� q-�>QC��	qh����nzq01�4��N���t�\��������ݶ���W��m�2{��|bC�(�}{-�adY���5�.�]�Ü���M�	����_�X��r[3g��?�FG�~�1̓���:b�F�e8]��"�j\�6�Y,�|>�]\��'u�Kp�s���JB�n���9�c�'�#ܕ��g��3π;u��s����Έ�n�JμHV���pF0N��mV����K�/7���܆T�4��.��B�Ѭǉ��`�hX���K��gc��7����Xy�'WGC��.�R��Ngb�Bnfӂ�RT/ev(�ޜ� ��2I'�&a���ݪ�.D �o8��U�S�ޜ��:�o���8�Nu�.-�/֍C��6��~�!5�3�u����x�����\�8�����8`��8Z�� �������m��md�1W�o���v4��Z5�m�|�$)�xr��؉��L�ͧ}�}��yO�,��{��>�� ��ƍe&����~��b��&`s.f�aP^b ~��&:g	.�Nq6Z�PQ3x錞5灇�߆���
�AY�N��%<�u���J������Ա������q9y��$�]��)�N��l[o�Vi�v1CrݍUt��R �rh�$6���Y�v�P �e~'wFA��%�9��b��\��˓k����.��XgP.t�:
y�TN�[({uJ.� �Y���q��[l�^���/�[�EYuT�Fc>���� ���\� ���f���0T0Բ���Ҕ'����² �2HWe;E��ʠ���B��������{eШ0,�g#"�Xvb'���6��1�y='��;��ar$�h�*�?��*z&9�#])s��ɑ<�D��(�5N7�3	�%����1.)h����:q���7?��v���@�����:T��n�
���6Lj�6͑� �����Sύ�z8���X���8��O�>�3�s��[m��/�p���y�dm�
k�~j8����2�
���A�T��su��z�g���
�s����y�T}�����sJ3��������ӆ��N���%].n��c-q� �I��h���u������,#L��+�_=|�����K�3���4����y�~&����B��n�I�tCv�l�}�N� � �s}`���gy9V�A����ͩ('��N��hرn�U�S}�f~:.Q%ș�����8Z�t>0��S�je�VO� p�1�����(����egvQ���O3�	�|��-v�)Sg���o9�����I�s�������㝾2c� �u���-�B<+i r�3��&���@���u}�s���O�3� 4瑆	��ϱ�I����|���
����ɽ�٪w�p�AZ���*{縯���a`\m�/r�q���S��_��pO@5��څ�rp����o��xN���*����B�2��� `o_n��K�,;���4�O�tT�S.�Zs9���$>+H�����:ܟ+f>yZ{�QU�Z��6Q�M�N�)��[�5���v�j/��}��cʘT.`�p�zG��!�"g;{G�L�<��]a��@�/�� �W<,�~,uN�UD6�q��`�3����`+�vr�1����@�-��� ��v�zb4�O[�0`����ĳq1礻a�m�=#W�t�Ƕ���P{�\9�a��s���qb��u���" LN�s�RtQ!@l���0��Z�'��O}E�3����8׃:��_�y��]ǟd��e�&..�v좓���)QH}��xko����4��u��pOT�4a>�}���1���w�i閱�e��T�Y�d�\����6����i�T����N�a�Ǚ��vׇ}��Iv��л�cx�Z��v�Z�dq�]s�%1m�FߊC<o�ۇ�6F)�T`�e��u:���|�^�M%��MJ���V��Bp;�	7�/8b�����z��U���X�����x�3�;�n�!oQ�-6���YR�ە�|/�Mwvɜ�.eغ���Qw��8�-qp[�]o-�A%�1s��
��p�pFPF 8��7�]nk�)�w>�Pkq!��Xw�%���K�q���� jw¸?����vɞ�=��2�p4�K�;o`�s����}�q��࡝pF�%�&���y��,p!���6�6�wK�N��!�)�.J�����H$�!_����M�g�O/0�3�Yquɕ�0N>V��Q�\����Q��3������.h���qv��۷l6��l����um�vB3���ۆ60͙u�f5g��Gi�zd}�>���`��i;8�
؆�x�00م�>U����*	*�K�!���YG��h`�U��ZS��5�c��Y�����F�7�}���}:��Z���T�+��`�[t���{Z.�������3,Yq��b�d������8��JI(����9���8��x	�ű����"�71���w��w �*_Ǐ���ٌy֐ �Ʋ���j���N���*�8���
��    >EK��՜˙-C������>l�{��,��GϝVwJn��!�3ޜ�l)�8%;D�����h��P��i�Aw��׋�����p�c����a~õ˖&��c��0��Ll�kȬLѭV�fמYH�>�Ѝ���KC���=(�7�2�~����+=�1���m�Aܖ]U�������nY���D�ty����#y������ZO�ݻ�2:O֞�hG�c���Z�8N�Ǧ���ö�i#9�"��F��[� v�_r������?42�ϊ�P�>��Y�]��ۖA����!��ό�g
�^{:�֮y��*�9�h�f0��bv�&�xcGv�~��N˄IX*=gh/�1E!���t5q	zf
�1�p��8�Ŋw�ؼV�؉��V�yH�N���~g��k)`���f��-'5��o�V���İ�CY�:�����6FK��3>���ҋ��.���Ƌsu�}id{ѝm!�hy/��*v�`Q3{@�k�kY�Q+��&���
Hh��m칦�Z��3 �!� LV2�j�IqP�l�T�0�4m7��#^6�L�`i�+8g��J�)+/]�.��e���rY���o�w���qc�,Y2���q��xh�.eG���k�OU~��X���b���}F�}2Y��#~�A(j�~z� ���m�y����	/��ē}�I��s���_�Zng�4묦y��vX���`�ɡ�7H6ءyc���;
.C(Q��1�@�?��3��s�Y~�kX��:+��p�(e{������ߍ=������_+F�E�ֽ\K�S6��e�ȩ��O�눆=͊+�ܲ��3�˝����=��V��8l�c[��V��Y������*�%�������vܺ��rL��Q��k$�����%2�j��@K��v̈vG�x6�s�o�9����he Y?�B��O<�4*�6�����'^�9m�_v*���{��e+��Z�\��:��iw���}��q��g<uMQ��]6f׽�Q�Q�O��:����Nc�x�ea.ĳs���_��{�<����t�}��c4+"�o�3���p�L8�Ag8IC����a�+�T~*�	�M��#_��� D?9�ہ�N8$̋�*��X��F�3 ��?u���O�=O�§O�!8iò��M�8�
7�0�`���r�W�.�0l�̝*�y�\[�nq,+��+����� XjO^����N�u���8�/�fМ���;"�)�H�Y���Ζ���;D�2ЇA{٠���r\���b����cm:0ܽ�nf�H|��z@�αV�9UwH�߳/���!���Φ�Qn#h���[�����&�b;>���{;��q"�[�u���K��?�kXE��:���H;����־{��sQ����1ۖp>�پ֮�plG�nGQ`+�3	�b8oA�ټ� 6hF��nt�XU�Eg%�k�8��A��5�g�B����u��~~<�a�g���B�ݚL;v�N:���LfM$7z��� p��m5[��Klϝ{��%�v֕\�:� rw��]��)��T��r�͸Q�?HͲ�nl�����0��K���N{�p��mQ�^{���=$�Xeې�:ns4��@=+s�w���((ζ�3����n��$��������|~Ί��蘻j�ul�V">ZL-�F�8�9��t�:���X���+�F�A�9M!�]y,����	w�y���_�{VA���86��w$��A���\�[C�K5����� CgL>��|��&�{��I�fϿ�,�V8>j:����~Ns'�k���~X؅E��|��rwwm�(� +��r��{Z���ⰄG�����:l1�� �SE�M1��_�Fu��\lr���A�X.�u��E_'��EO��2��Ӧ%�c2��p���j��a@a�"�Ύ��%ln�mKp:���Iy3��*li��('7��ءtx��r^��u$���W��L����dΟ������FӰ�Z)��U�H������1��S�-9��XT��N(r�^�b��T���䞦��zƁ�cU��{��݁��~�m{��;an0��!�(��/f����O��ɯo`��U�6�����߯�j��X���`������X]�s}���@
?��D���x�!���< o ����������~���S���^V��z�:w>�[�-����.�j��E���x��3h���P#����
$��j��{E��b¥�w��ȝܜpo�$�*�m���T���l��߫rr#Ʊa��o}��i��ߍǏ�y�b�e��m�ݻ�1i��k˦W/��8�=H·�t��ݥ��fW�!ɦ���ny\�	p�Gö/��^�W�����_\e��Y4{ ��J곭��K!�&��O
��pљ}�՘��@g��*� ����U��=Ӷ8��5wg��׋�qߪ�1ՁC g=㩚�4�M���8ݲ#����9�"�q�N����@����4Q���qjnz6j	F����@/�"��ys�D'J��|���Yw�]a����\9d9ݍ�����q�'���`����q&�`~݈��gV,���9s��M�C���-#g8��^ӧE˾�/[��H��Ӈ��Xgc=������Z�^���� �˙Q{V򝹻���';;5���eh�9!7N���K��t�w��S�)	�=68�ƬNqR�"��$��#{tT��U��w�Xbnq��#�^/Nv�u��������Ǹn�:.7�{����\��̎�ߔ�ǘG4�ݿg�G�U��'gc`钗�@�ӹ/��?s<��è����i �� �=��ϝ�j����uՋ�y�
�r]�=��]��U°C떑@ʗ-�1��ǮG�W�;W�~���|��l��������M�����ˮ#�����l
��#� pNtE�����eq��4*����ͮ�����̬3�i▫s�N�𚲑Z�(G��3��Z%Y�⛞����tg��8�ָj:S�Q0��?�o��O�QP��V���R��������5���1@��r�L#^gΛ5�E��6 u�E��;:b�l'{��n�3��X1�,����}Ǻ9٘ki#|�����o���qv�~���rz�`w����ҩ,̎����T|�\(���*�+���t�=�x���:��P�7u��W؉ߧ`�8��V��ъ�išہT���5��D�M����kǆ�z���s�vUL��>��av��øݲ��vGg،�d&Q�sCR�f9b�t~L;���p>�@��S�t�ᬆ� �M��N��8c��`<A�N�n�='�d�M��h��X��4����3w�]s�[���];5a!�;��gQ[�NyA�;��Ǝ��-M�u���f�2ӳ� ����{�9�m@�4��� ������L��t3�'��n�S����0c{LN{v|�#@cqg�e�����#A�T����7��On�n�YST��Ǐ[ѭ�y�-Y7��O��e�|�|Xv�j�z��i ��F��o?6n5p��������K;s�\��qЍ���7ɖǲ,��!	� &�#�*�!�s�y��(���O���X�K��]U��'��N�0}�
{����g��;�y�����lr��C|��$x�;]dJ)[ܘ�d�=���2cx�=Y�sv�#Ԅ+���K���c=L�)�J��}�GӋIt��4��޸����v��Òu�
�,h��F��ͳ_�F�y����5���'%�Ep�ELK�_���2���i����"�py�"��X�+QMo��8�<P����M��s2��K��S-�)��%�S��Si��4�"�q'l<z.�g'�p��^���5t����4GmA"[Z+)�f�����jsg�qF�G���$S��>�4}��m;kc���rK:xbY'��]Ui?���*�O�1���3��0�ڮ�++Af�SѥE�[���v*;*l�
�ݤ��b(s��+MNQ�J�]X2�Ў�v�s������t����gAE���W\V�{?󺞸v�g'7Q��<    �����QTC=t���M��>�į�1�M��=)�C�����5N��ko=�o���L��5�#�T� S�� z��IV�uq]�@xOB�LD>*3��m9U�r���h\q�����u|Y�'=�Jj�I�T~:�C%�X Dgs��gj�&�F����q���#���]�k����;z���vpdT�]�,��)sUx���`٦H	��1����#�8�	4��?��!�?̼�H����M����>5̉i}�H��x�gvr�>����%�G�[˘�M;���x��1��G�&E���Ƙ���n1tk�tR�`i+R?o�:���E)�UL��oM'���ZMx�ȏ��S���2/}���KA�����u3ṵY{�^���=P�Uv��܊3��;#��%;�.�]ܦ��C��;�Y1\R����A5"�v�D�k(A&ϒ�NoD��r�b#ܸ�)�5�5]fD�L����NU�Jc���^������<�$i�-x�>�U�gA��k�"Y�$}���'(;�?n����IE�7�����KCҡ�pm���,�9s�_��8rT���mu���9G�<N��ݒ�C�\�HV�]
_L*5j����� �W=����vI@��Ǿ��}�B���.<�s]�����>yҿu�JF�K���@�rZ�cA>4�j�k:,��Mu�^C?D���G�qr��!�CJ�zD����������o����)��;r��PC`��1*^�p�vFEe����� f:�xV��f��u�(��W0���٨��bWG��L�_�L�i�{�[NB�7���������9)�Bg��`%°�r�$�6�ȣd���u���Ut�b������A�t�6:�����W�a�9�^Q6&�.[��\?*KS��<��D'f�R����E�2�9th�)��C��Q������k�WT��\Ssِ���e�"�z����-��dZ�R󰻀H�q�>��g,�/��d�u�=�eɨ�$���?3S�J���'���j��X=d��
��T�Qj��U�D5Zy�_]��V6�����R���"�����Y�[$�Y�܃;pr��L�+ˌc���ÊZ!ݖ5*�?A9�:կ����)��"9�G�\����W%�q�y��*���I��-���|r�S�������\|��a��V����-ײ}j��'����͚Cn:%�nB�)}�B�ʀ��;A�Qe/�DMUi�5���3����U����oQ������4�P�!���[4�]�H(]wM�����P�."W��.+��"���TG���V��箧$���p�����>((lw%��}:���rD��Y�&<ig�_���eQ�I_�G����*���?-Hɘ*~|�/��t��������9%<;���zQ-���y����Mk�z�麙��z�H<G��ԩ�?���0E���<��r�т��V�nf��n^٫�Qh�0�ӬH��Ŵ��K}0��Y�ێ�u��F	1zg���˩��p{��;R�(�˔�iao\�4�f�l���C8��T~��ؕ��}7�Zw�il$e�����|)�ꑗ~�_"���&�4�8+G��p>�:{�Ob�*͑R�Q�����MS�XA���-�?����i�T	aI������W�艫0���$Ɉ�g��q�JM�1���޷v���h��!4��5ݼ�9Y[ﺎ,z�ș__�Џ��ߪ��Q��r�aɘ��������w�Y'y�T�E����lT\�<���\!4O��O�YB]���ڒ��=�2%a:���b�3���%��(5(�s�-jJ	��<9�fQ|{�FCP»4�`�/�u�-�Q�}M����{aW�©�s�Od��5F��p�"�=����?���-�=�F-	Y�U��x�, ��i?����i�h稆���g:�;&E_NR���:u�|��o9��tI6�j��v�|��F�I/���T`'P�G�����R�o��BMӉСG�&���͂Z��ũ��=޳�xd"���'Yd+I��/��z�_��q��;�{B}�u�iS��Z�SK�[�Dk'JP��ڰ)���;.�P}@�����*\����8[��w�/ ܝ]GI�����r�_��;%y�b�R�)t�`U3��ݙ��
uy�Ҧ�j����q��Z,���LN�%����1_���#$��Sp�T��έ|	�"�]d��UN��G~tyb���X6B���h�@#�R�p'�Z�H�%♄�"��Xr�D9���8�-��t��
�3񡳷�C�+=S��~�G[��!^h�Ύ�i(=#��T��a*�$���<5�T;�m>���i]Ԯ�_��K��z�ʥ����\�䜞'm�������	sĈ�
�c��N�>i���WS�F����f헚O��YC���Ӧ �U^����ĉ��'�������hkW9I*Z;�V�ȱ���aGS|�җd�.��ܔ���E��RF=>��L���1��#�D;���QQ�ȲK*mi�cfT���H	��^GW�<	�J�B_M%aԣ�bϩR�#�Υl���J�OW������h��}��ǟufEA��@8�%iU�4���$��IN��Zu��Px��`��"]q���`Ӿ�Y�5���W�Q�LD�E�.j�\5{]�.��E����af
TZ,��j'��M��!޴_s�¿�IY�0R�Jσ[v@Xo-�e��r���>+�;���_|��Z��{�����K'l�j��&���B6��Q�R��K��e7�?�[��;���������D��
J4����H��	��Z��"�ˌl�d�Y!�Wr$�wWjV�듕�5)_r�?�]Y�茌u��N{w��̀�C���$CV�:�R��m7������j-R#��������p�i���}�!Ը�Q�;�c̬/߭��ZK *+ !��?�ˬh:'�B�\sYk9��ٯ�d)�1
ש�S�F�$��{�� ���:d�z�s���G�G��$:rH�f��$"s��,���O	�r��_̚�]��;�p,���Sd]�'<��9��9T�i������p�3H�-nA%B˧��IA�-��lĕS��v=qu�Q���Y[���ͼ�����i40�Y`â{]ʖ�@�:�|�ɇC��V=�|k�%������z��v^_���&S6�'��ᨮO��E�#�[5���ۍy�S8������&���0�Mܓ�*�T��3�Hť���^�rf�P;��o�/r:Wq*���s>hI�j&Y��}�]S��R�3Ć�H��h�����S=�ihRs�!�l/,}wnB����P?�C��X+]�v��v����ft'�Փx
A���Z�A
=�-�=�5��!yG��}K��]XޛI�	���\���UJM*"������|=f5Ӷ*���1{�,=�B�5�h+]����O�)���O�x3���\cx��Q��qz>��&���|6�p����#���"���$�6�F�ꐴ�J ��u>9�oB���o%�_̞��嫨#�w�BӃ�KZ�s?�M�0_]�`־����hTZ��D��t	Ȱ����j���znn?���A��wn���wh��^εK�"�o�|��ή��4�z;Rp5��c���꺔~��Fĩ)ZU��!��ʹy�"�01�<��/u���Z�F�[=��YG��k7ݤ��'�kZe�r7��]\�xj�l�$~'l��"�k�将GCҫάh����}��يZ��X�;ԲO�b�A�q
�:�txL�i,mJ����V��ܫZ���f,����`����뇧_$_��/���0�i��Z��-�d���gy"c--8��xn�wަk�B�����L�����Q�3�}<�%�f�Pʃ}�`��!6/��a�g�K�H����wy�#O����?��� ��������"�+�:����ok������݉;���)�5��oA����<�=�x�7/������`.>�R��������S!����x�������KS�-�,�g9a��������dgY�XG�{\F����w���p���܀���g5|�Tv9~�WO��a'�A�@��#��#gj�M.��N1�TԎ�����)��+\\~7�e7ϋ�    >��������4�~��#�;������h߽��OL�����x��;U��J��/�M}��5�.��e�G���d}#P�/>K���G˰�9����w���Z�K���I���EE�;��X��������U.����_חS��z��n�ּk	����[4R�~��޽����p��������x�W"\��rT��]CA��O���X�����S�~t���O�ߘt�Ӊ~���ũ��f�G����~'	�{�����������G��vn�u}�>nL!��h4kїl84��1�/J
�ſG��g�/��h^};!�\��&��j0�;��ߝw��k�],pW�w $?{�)Jh�O}8�V�%�1��Ї]����鉶�I��>c�������h�j��v��������2���[kK�J�}��}&��Ϻ�K��Im��~��~W���~�^AS~�#Eާ"̿��t����wq������Ջ�K�VѤ�kǻ����}ܰ�"bij�5�7���"��u/�����w>�q}�ϡ�lP�Ż,�@8��M+dC+�:��%���D�j��:ަ��d>15���Of�x�0�sݯ.S����6K�=���c��?��FK�J���-��w�9	_Te��(�����:�l�?�3$��j���З����y����~
��C��)����Ң�o�b=�s͸���V1W�4n���c��9���<��ݕ�q��	�mV�
������
��s{�9�3z�������������y�5��
b}պ}�s�S����q�����?��?�����_�����������V��/��������<=Y��~��1��L¿����mb��:ل��W��r�f�R^�Ax�]!Ge*���Qb�����"sD��h�w�ι<�qp4�6�Ys���M�Ek����jv!@S!��v�?o�)����W�����G��'ڶ=z�]"5�?���>����?o���h9,=���|g�@�����o�'`���_g�����HOU�����]2<-��~�[2G[U-�r���ݑ_O�i>��u���c�)�Yk����`�C�E�Cj:)��6?�l,��4t���롨����B��8�U��/��c^:>��+&�Im��Q�^S�jN�_�3��:.��SQ�5Q�#<~LT�6�ْ�`H%*�?�2�T_e��7��-�9�bC�qU��O]ڌ���v���U�8°"�G�,*D��	��]�祺�����n�)������վ���D�n�<Q8�h hR��v��m��Y�9����x>>�=|��+�^J�3٥m�l�[�89��V�Vϙ�V�:Sh���Y���EB��\������+�����h�C�K/�j�zD��R��P�j(!���g_�g8�����7��9��/�=Ǽ�Y�p3Ѯ��-`DO�z��ݝd?rJ��,P!ڗC�F/.I�T�T�;�����ǯ���*���?�[��'�`�]'������ Txh�t�TeVeoyE��#t��Qz4F��Ⱥ)2b��I�CP&ˁ�����t�w���g�-W��M�>�]U��Q��x�_x_$oQ%�l�Q�D���+�D˭E�N�9�L�k�=k3�KM����9.�o�����-v��q<����>�C���4J�|Z��<);���9(������Q�o�]����;Q'�(/&��~|��j�N����P!�zmd_��H\��]ӈ��Rz�m���Q�*\�l��9�
��_�ѧв��]E3���l�`��=D�ړ����*�P�����^+�K��]�l�ᅅ/ff� sg^/��޾��V�n<�5��ǣ�?��өp��s����������,�.]֌�!N�jI~Y��g55~q<�
tzK�l��p��}��wr�"�|��4T�O]�O������B�w�]G:hYM���yS%�*�o�8D4�oՈ���T��|B8�G��U�cD��:����ܲ�sq�p��������Ζ��d{qv5Ěq�.ϔ;:���Mz&;B*I�[��u�fs�@���k�eb���i�#��*/�u����#	yP#`�#�lK��id8�yhR5_�;�W
G�b:��N D��2�����%#6X������S���������SH�ЀMۆX�sjh�o���Q�W��#p��n'kܫ~T��Z]��� ^?��4���H��ib�v_���}_�JI�
s$QӚbTu��]��A�#d��E޽@;��XXU� �X���y����	w{�N�C(}H�w�̚Jam#�)�����<>d����:k6'3�':�0ޞJ;]J	����S�쐼H�M^�2,.Xl2<�﵋�/���ܚ\ߋ(V-u�[��2���šE���JD5B5�2P�]���%����0�[����r��!�uo:Q�<n(�z'�AJ��X���l�ZSZ���>�jw���tT�I����SC��Q!Vǥ%L�I�-��8%!]��%w�y�Km����E�0�ķ���e�W�^;�LU��,�1ġ�ITz�]����L�t�f�^w�T0�:4�۫)F��$FG��sTG��p��!UM����y�8�m���$�x���nO�}<Ś���מ�Ql��tTz��o����Q���R�"|Z
Ŏpu�D�")#Rw�k�:~�N��Q6waw*E�О��Gx���ЁU�$��n�<�D���������N�^eT d'�]�#��׺�?��x]RBU�����tM ߬k��=J�	n
ۡ���R	bVV��UG��R�}�g�M�ᤘ�\��3R-&	�T�C�-e�����U�����\�[|��l]�����{zp�h����
����wԾ�9���tص"���&D��
�9G�S$�{� �j!��ȏ�����d�+���=YIQ`^��\b�2����BsA*��#-��ŝv	,�$ҙ6_v�8��O�Ć[���T$��RPs�=�8W����Q�sS�ӐՈ�rl=�'���jf�o��H6os2!��|�0I!���T�%p��/�8"y�y������f���k���Jw]�c�ә���1ߤ�K��S���f�V��gL�IAY�Ԣ��]��sW:��lO�Oa�?�a�1,5�����5�W]�'�g�!u��?ޗ���J�ܚ
@�UX�{�)�2�m��=U�6��4����y&�������+DWq��J�2J��d��+�]D�Em��/;�{I����HP[�f���L���G=S�3�lJ��Tgu�G�POa�=�X]�����I7���)*������D}�y��,�����z�3��Mn|#�S�Po�O�T�?E�4�]��y(�i��c�I�4)�>Wx�+�pHԑ�!��5��3�z���v��Guɞ��8)�'E�-8 �{X�T��HW{���V�4�0HU=��Uˣ��%Q�8���$���AI�R���Wu�H�Qq���T�7k�9bz��B��jh8y��	��4.��M��6ͭ�Y9���Ti#��i��5�G�������T�I��1�Η:>lp��BPrO�'�����V�=�}�Ȝ;WAeI����9Q�\���+сT��}�eC��P�5A��0��8�����`��R��*d��y��$ޘ�U}Zэ*��`�t��G�~��s�3<x��f���,�~U^��\�Zq/+����d+�~j��� ڼu���C�n)T@V�Y��!�v=�R��/V��/C����a�b����m����y
���a���3jJ
O�}OR���Z��]9߃�㊋Z�p�'m���U��h�N��x�����Fzx-��,��$C�#�ѭ��Dx���=Z��]7^
'�H�>��L'���I^c��w�7UO�!���R��m����I;Y]	f6��wE�aW5��(����N��ݭ�){�d%��u$W�. ���KU ��L��T��t68��/���V�t����0W�����x�]� V�}fyս�����R�mg��Q��3���U�|��h�u#?�vC��Tas1���"���<r�j�A�=��?her%�B+G>.�ۛaê�K�B�b25XӱCX����sv!
�w��ɡ��    ����\{�]�Ѧo���kwlۯSM�InV�����`�%hSԙ��J۱�R���T��@��xx<[ �P'2��Yߗ%SW�6�׵	�AS�*`+��x���(Vu~�l�I)�Z����rL��㵻5�f®{Y%e'����)&���}C**�n�:��2�G�k�
�
�Ȟ�*�/̚a{��0���2d;�b.��pp��$����Z���t�m��=T��א[�ϲz�����ij��!)֑�/�޿ש{@3�u�7z�%^�	X�(:��d:���J����=B�=3y�5��>D~,7B�܍5�
�p.�HYS^��E�����5�za_V��
�2�*�Xϯn^����d�x`U�
�C̦Y��ų�TV���;�ɝ�"C��u�B�.�n!�9jm��m�]�(��C�L�.Q':4tz���^�T<��5�1�N�� ;�u��N�:j��خ��C�Em��SQ�B���x�Y�B�B/�����UR���v�F�1!�Fh�a��NvB����"�%�!�|�*\�f�+�sU�J�w��/�#�o��	�4�O��^��F��x66n�UZ�v�<i;B)��T�-4�d��I})	��u8�R�^Mm��#1jJ���h�I$��?Dxv�&7�O��*�lM"S鼦n���(V�
��笵S5�]/G Mwv/' ���r6b]������#�j�����a�̔�y�"Q�H&[Wȑ;���(	�Ա�5�s1o�V���76*ijϲ�G)WH��ˠfi�mU�+ǘ�O���e����vB
�dmL��~
�bQQɓ����Doʂ�~-���^�8Н���
�Z����б�cF���c��{�(L�ʼ>T}��	/��hh<�_:��j(�XY�1�Qհ�����0�dahE�Ƌ�u�^�@g7��E�{m�<�MDҋh�FW?d�=���z9�fc߯]��Z�7���V�a��۵O1�����3����D_U�}+�r�F)<nk�P��Ew�V՟ K����z	C)��A���LR�U;�6��.�t'_3�ŷ�ZJ��^ڭ.�^�׮��MY��U�3+\�������vQ��N��I��� ���S��xX��6쐽酠����<��G�_׽�e�nL�G�a �P[��g��2�/�Q�N�_�~�!��ᡦ$=\�i�]mə;�py�MG;�T����/��<I��orb/�Ԫ�+��-��"�.ϗM�Ę,K�trX�XM��,¿�]�$�n���"OR�g��8�K�B}z�u���[{R|ہ��s���sv4ڢ�m,UR���J�<�j�*~�]5��V]9'�gk�)X�ļ*o7Q^�4���<nt�m�W����)��.>vϓ��ɼ(�0U�<�g�P���V��'�ܻ�]�{h��9{CP�>�²�Z���&B�ʧŖ>��UBq����x�t�'(A����B9�1Z�3g�e��[:�x�9���
�%����X����$����q��zK�9�^_U���d)2�*Z��t"�Qf���
�k,{.��2�E�P�D
#a��!�$ڌ���g_���F�E�۽��_�� ��
dr_׭�� Q]Qv����4�K�b�L�޳���kX��0Zݴz�O��ZCg|�=,j�&�����H������\<=�5����J�h��9��F�Z���طlzZb7W��IRr��X�׮e�r:J�&�/�sd'1���m�.~��&
ڑMY��*F��k��{x��X���S���e�&7'5Ոc��\l2�o���7"̭Z�T:�r:�h�ʾ�y�Q����B����U�N�?	'0�H�Q���]Og��8�~R���n�w��C9�T�'�nZ?�?q�1a&��[B���7��ݞ5C��W*>Q/fhY�cej>E��i���,:3o��$�z��u����w��gI�QǺj��c���t����C��X�R'��;���z8�
�_6�6R����M��@H&VV,R�ǭ���K(i�4 �LB]s�|[1ךf� "�ˢo��a�w:����P�þ�ye�>�ld�t+����Z3kU���Kx��XY��J'V�΀p�_�U�ꢹ�U�GՄ�c݀@-����SX��k��P�I�n�/c�DÑW�m*�v]!^��:�o�%�r��.Ml7O���Q��aUO��]X�����%~��@Y�c9]�q�"�E(�5������_܇MU��E�t����|�>a�ʛp�ݱR�t��>�����7�{��`g���k��(��N+�8�PF�wPT��'��N	��Js���&9��/vn�y���%�ҁ�3d>?�:(�__���gK=�B�ڌ3Jm�H��|E7;qp�?�ɲ����TSq�Bm��RcD��3.B�09 <^�F�SFz���u%gke��� >wYD�L�U��M����
#�6}�T�;+�H�z$WGM$ANm�~>��0�[�s����\�U)��/�chQ����<��������LD����P|w'�R`j_t_���i��`��Y��{
�'U����a3�z	�SSzO�k2�[�ݙ��J�I�;{�J�M��<X|Wc�GkU��ͣí��]���;�K�W�>Ӣ�=e1�ģꞬz� ����l7�U���R3O�����=C9��2�nM������ڵ��]I=��VVs-�r��IpH���lgv��7�񏯢9�,aI�����̊kR�o��z�/�@vvIӧ�H��Mz}�S��[t�IaNqPxb��3{�Ǭ|���u�t�~�����R��QvPc>�`�=�,Q�����ŋ�L�΢{	���d��*P�m�+�8�R���R��qܒ�+[jW�2/��ISY�ϗ�v������>�R�oY���|�a��D�_���cP�;龢g��;6S�ۄ�{��*%T���,..�YQ:s/͚�]*����������`3Ȑ��)4��I�)�1���)��H}_T��/,��g�Z���n�����-;�Y ����x����Zi�2^�3�3NtxJa��3%.���R4e񳋥k�څW�����.�($}%���j����Gh����,M��ѩ=UkB�*fN��4�k��N�O�!rb��8��^lҦ�Wxl���}����F�L�N�
��Z̋z�w.O��R����Vc�?]�UXS�H�H^�
)sTk+�i04���e��MRU�%�؞��2uf#T�t�d������D%t:~����;�:,��ѯ�����ۭdy��{%��8@�{�ݵ���#�z�C�]��~�����h����;��ّ�_U�?ֹ+'�M��a֓�3��SZ�߄�� (�͹�t?r�e��?u�����.�2N5��V���w��·��K5��-����5�Ʊ�������D��K~E���OV�}��g�sy�I��4�wϞ��`��e�����&�Z �������	�*ō˳���YT��}c���ɥvr�D�9iy�xg/��j���ϳ/~K�$��r�:,ٝ����l�#�徝ݣ��T�fWiu�!*L�39p��̣��η��Y~�\�x��O����-�Ց�[�����'����`� �����ڲ�������S����$�T��������������͓K���֭ёw�g�I���z8\�f�y�9�-i�m�xs��^*���'�נ?�����j9�x�-ņڣB��*1�E��*��u�aB{�w��7�S�cj�e�w].Vq�d���8'��� �ٳ�v�}	]P���&�O��<��=g���/ё���C������ͭ���Kb��Ah�K���N���q�P�$6OX��
������D��Ne����VU�(ơ��=�,I�Q�z�^M.0��v^46�ة��w�(pɒ�^>�~�9��!�k�ӾK,^֦�	3u�]øw�u�nn�����6�S�h̶�%�C9P��w\���/��f�}���dAM�uI"1ˋ���-ֲ�W��ƪ���R�+�����f�a6 <���ĳ,!j�He3�	s��~������6�5��o{�c��<��Ew����tz	���JG4]t�z֨\�u�>�l    �SUuނ�G�O|�DKpY���K�ġNDW{�(�T�z�N�
���fgct���f��J*��+�P��?^j�FL��6yt<丙��\�>�dÄ��/��^�6bvFb�N������|<�O\/���:KG�Ԝ��B�LT��t�.;���uT�ժ��`�:�M����)`\%��N�w�0OpT�v�e�j|&i>jz���l��4��鮹J�=7I��QTS���6HG�9ַ�����6�Y[���|�	�9��H��;.S3�C�g��H)ic�HZ69[!})���"��,N�oV��`7CceW�/�f7_�v	^D���d�}��6Q%�+�C/���،NO��$�"��x�"iRR�?��⢟X,��䋻/�b��]�e�_��Ҏ�����uc=ǧ��ӿ�8��9E��	���m�dv!]A�?�Ӟt���{�&T�������>��\��q�ۯgm7���<�(�VJŌ�O��k�M����S����a�}���QC�QEf��m�eF]�Ֆu]{�u�}�^M��n�z��[�e�K
7"9�J�8�5��$!蟞���>�n�e�n�U�r�[��yĽ�rb����M�I��L`�)��99��Vq|�e���:�+���3d�9l�?I �����J�%���T#WO�i����ָT�[���ٰb%>��6׭��C�q�9��%$"�|5��S��j���Am$e#je��|�1�%�8�7�s�Fk������ʦ��-Q6ٞ�j�2뗲�R���^���D9�q�0�.������
�5�� ��L�u9�&9�lV]�µ����!I�C�Ɠ
�YTu��J#9*�s�WS���\��Uj�-�:^]|M�#�U9�;���~f��MW!z��Ќ>��o�^7����U�	�,D�d��+$-۾b_B[�Kߤ{��﫞�~dR�H!�y��ʳfb^���ICN�>�'���N"T��1u�3I�I��]U��wi����N�8�+��6��٥��Ç��X�|�����_Z4w��v�G�@Q|�m=I��'�n|h�:g�i�n�ã�'�\�}ΜR�5.BY���2���Tח�<�@h2��g��Ջw\z �I���%�,$
��@_J���j?~؃�����g*��>DT�Q�[щ�)T��I]�;|�l�l2ztQ���;��pޣ�QNq]>Z��!��o��QC��>=|1^�^M���6��J^�0��J�O�Ϙ���N=�u��4�;��bJBEut����.�����殛���N�����c�=K���c��N3+�Ŝ�w��Ign�b���e�����)K��un�2v.���P�ş&ٽK�T�9l���302Ԁ��)S�ճ��t�C/���]X�
��ĥh��S7*�*�`��.�7�02$���D��вr��h� K�Y�ZE�U��N��S�h\{�B�PqRB:����p��yy�P=�抆�����`'^���\+�ތ�������	�r�~�*���oy��d�u����u��mD9x]\�i��p���S�8�1M����tftˡ|1(�d��Z���̤�c��>\;��ë"O�48
,�L�V�.�R}�kO�=�#������=�N࣒=���<?$z�0�y��yfx'�_=��w�](a��ݿ&~s���[t~.T&$ZN�q�d��T�$�S��Bݫ�h���4�e�[)�$T��YјDEԏvJ�ػ��ѧj�Ք��~D�e����X��tA���ӧ�m��9��v7����R}Mw������Z6˥o�F[�N�w{?����,1
�E�(�C�e��Qȳjf�£G���D){��k:&
�$S		��_]��AA��~�k]``�oI��N����Y�[mƮK�;^?s2P��߇R<���Ih��l���4��A*�GZ}Jx�60/3������C��[Op�&����h}I!���Z ;ߨ��]/��N�g!o&�`Al�A��j0i4e^BT'����L�]��!L�UY��󭱕�w��+;�
g_��u�!����)�\�urs�8�K)So��^?�Ezt��-�8��G ͌Tǃ���T��s�u�~�-�C��Ѳŧ_ԗ>��������/(��V>�ܦ����,Q��JĚ�v��r�QX���pi�ӵ�
<�4�����ַ��-�]h�g�ĥ�4�F����ǭZ=����7�=ˤ�"���t|��ә}/�7�DD4ۮ|��uoZ���Jg#ti�M�w��.j�%�M�,{V	�-I 7��]"O� �ѫ3ˑoc�'�?��y�2���\�?����S�,����2��+��<'�Iͼ����ף�ל���Lل�pJ���-�.�b��o���ֲ���,�#���*(�(Tw;N��Du�.�)�	gL�����pB�J�+&1��竺q�
B���GB��Q�(E�U��GOh�U�γO����t��۾؆ﷱ$�6�W������I���5�@����XVΩ�ƌ�(�������5��%�Ԃ[��4����F֓�F�����w.�����lV|�zڹ���X�þv�7���)MP�$΁�ڿ*H����zBq������r�Ov}+R��ɳ���.Q�:���	�_KL�}����� �7��$x�=N9��"���ybs@UhhV���0I�EGAA������<O�T��V���L�)�#������ON15�p��M?�i�iV]�j(41�K��y�2��62i�W#�y6�)pz�R��/#�[�zV��r�"6�"5�Q��γyb��B(jˢo� 'QĞVd�N��\���5:�9C���P�xD����Y`?�ꖂ�x��E���f�\Z+*��}m�bAdFu�}6~9)���K��>���d��X����ԛ��)�8w�����E�zv�2�.A����ł����:��i���z���_�l,������]�A������{kEy�K��>Mu��B�In�ݕ:��yE���z��s]�?V|���3t7���7�(��`�k-5���\yΛ|����0K�ǝ�Y�M�p����Pi�x�ܢ��[��Y)�D�`��4e;����
�]�p�fV����,mqL�g�ܨ��2��!�O���I�\�s/��J�K��+S��I���h�����x.�(T����2��4�Q�z��?o/}�^h�Z$K���y��H-����HV���K+	m#%������Ϲ�j�(������S���<-�N�7u���H���@3���N����&#X�o�s7ڙ�<���]�����4���Zdݵ�on-y4��#K���hѸH�"=��,T���B��0�nޚ�uǊ��V~�x�_�h��a�j��g]
@�f]cI��;9���bڬ���U�(.yH���M�Q�V A��S;�"db�]��Yz�).�x��O���L�T�g��4�Ij�H��	��`��QU* %T��.yQ�y�
W8(��C�Ч��J�C�N�\�]��qJ�����3�����6�{�#���Z6�(_e/D֥��� �ꡳ41��z�X��%���:��D��Di��L������Xm�.B�}R^�q����Ԥ�朝��ȼb�Ju�R���e1�~<}�5�}�&̃8"O��ި���Bei�IK5������y�mR��gS������(g�P-�>9�Q��p�x���>�s�YӮ��;b
��H��	��W{3w��$Α��+�3¾L>�p�����r����;
���0V��b-��g
o�)tV��>��X��4�	sߋF�-B�����Q�*r�4�!:O���Uw=c��4�Y1���+���>�ǰ�Yt�O	�������w����x�u����G\�t�%(t{7��>$��:�kҕ!��{ݷG���,6�@^)]�C�"D��eu�^`!�����f��VQ-ay��]�?ܵI"�l�8��=��+�D��>�5���~���Z]lJ�Y�+:W�1t�U{�y�a�a�/���ܗ���WWњ�:LG� i�'k�B4s�-���Q�����//Uc���5ˣ��N    ����"]D���$|���
W��HY����ɉH�q�����)��-˖uȧqߝ���Mũ&{O6�mu�ö�՞��%͛��)j9p<2�L���V��[�A󉲱���8���h�v*�w�Jd{I7cI�����ԗ�N�櫠�z e'U8�2؃�Y�{�l�:%���V�Gu��|�����M�Yִ|z��ظ,�x��������C����F[0�F���M�87�B�$�ǣ6�*و�
k����6�dv��������^�����"�,��4��ֆn��}R�t��$�g����t-�=�R�;�h�0��t%��୿Ej\L�h��2�g�dK�(ک�O!������27�x���Fs��J�Vx�7q2�ay.�v�:;)�}���Y6����(�O_(
Q{7��9��m΄�\͋��~��tZDҳm�|R�>�_�`}�c���l��,�]�"��W�~ZlD�����N�MɮR����]w��~W�E9�u�S�KO��!W���)�e�t��J�´��6�͖I�L�)��r�r6::�1���*�N�*z�������\��z8R ĉ��-�:I�ⅰ����Y�y������R��b���G=U���P8z�A>H}��`#4(/�s�����#�3����v�ZrՈ��6��0�i��
?�гdM�6���Sׇ�x(P&yOj6�����r�?N{]�<�(��KV{�HW�@�g͛��������"�S��M�NSA�Fv����=x3��Ȃ�-���(��ͳ�����J{X(��7Y�D/��*/�Ӏ�G�i�+���K��h���n��Ce����y�ϧ� .�#̦-Z~]-^G��E9�U����۴l���6�� ��H*X��ʳYZ�gJ�ns��*�4��'v��4�0�T'�1��������6�.[�!�I�G*�A��Sn���[�j��3sY~���{h��h��s��ɦ�t��9�	[F������%�	���Q��g�.�NikF����.*�JE�^Ϊ9eg��"y{�-�rU/on�j��(ײ��]��c�N�Hr��"��CS��R}�
�vh�ͺ�yv�S��O��>�r��Tn)r��T?g�j�|;�M�YU�"�xb�����`'���Uǥ�9��������y� $��X��p�t����$�n�=�k�wՓ5�>�/Do��пԩ�!19�S�p8�FS��O�!B(D6~�����c��`��n����ꎘv�+���r6M�o1�����\�	SP����%r���Xm|��S".S���9�ݕX��*�W<v��e櫼��%���Һ�-�q���pe�W�z�Is�Nh��PJ!˯��|z��8\�ʖ)Z"�wP�SDj��22Sx���T����j� �'�B2��6Ç���U�Iz�r:\>Zd�>!=�g3�s�o��\
o+�Y��j�J��	�;F@��j��U�~>�8m��J�S��c���ӊ���8_�V�^����F�a�]4���5mcQ�"D�y{ޕ3�M�E���,��E/M	,�LJ1��xi���E�Ş�St~PyY�u��+g}�ILk#L{%�ش�4�+���w��/?�>�!�Ϻ^]ƦǺ�E�.�ǜT@Ԝ��Ce��p��䖪\�ԭ|�\<k��s�E�N	��X�Ƃ�d�����J3��+��Α>O �§z��)�H�I��SZ����:����9�RR�����-�D�Lyn��iݞ�7Z>�V���DZy+*8_���޳,��G�sU':��|�ɜ��NO��ܧ\��*�ge�$}/>�T*�/�X�<2Z���|�,���*9+jes��uZ)UR��KVM��g�� Id�R���m���!���M���|�V��H1fg۽�H�"N�3��)�(Yl�����z����jB��͠�Æ�$�Dh�y�!X²%д:�o�oI&� K��`�t50Ԓ"�5MX�fE�T��hm�n��a�(#P�fFK�jĥn��ј����ru�U��_����/Kۑ�$S��.���5�zhb��s����u�M�tR[�/%�[Yq*���t�1>_�ʎ�SCF�"1�<�i�|y\i-��z&hѢm�z�m�O�8ã�9U��KbX���f�3"r��'�a?Š����(����5*���Ou��a����Q���A#�r�}m�����]47i)�J`U4=�ۮ{M�E��T����+�n�`��C����9=E��$Rıqwb6{�/o,i=���^�큶]r���x�_��V��{�uI�f��b�)Λ�7]�<ud�ӱ�����>�6�M�QꙠ���47�ۣ�h���k�!S����m�]��'h�Ҽg�2tZs�/�)��ͩs�I��{�f	E7�~z�����N����mcEf!��=�"q���7�Բ{�d�a�s��¢�GFXu�y�!��-�nx��
�"�<-��Tp�%8y���*��9`9�*ހ�.�׳�l�r+N;���g���v���i�� �Pv��{r�x̱��^�z�-�i���9U�>�а�2�ĩ�!���U�S�5�ƕ)���brQ@�l�GR�������2k͐^�qt�U[�[iª�b�Sn��F�Ê欪~��sWEOIa���iޭ7�X�O��m�u�gE�Ki:c��Q<�UQb�~�)&{4e{�GX����E�����Tg_��B��V��~,�e/"n��n؍�4�*І��b�I韎K�
ّ��rHj!����>��@8Λ��N��i$��"���V�<�r���d�gh��R���)�5�ש+�y�Swڡ���e��qn=!�pm��`�R[��u�F��6���w�H��5�|��V���Y�?�n=]��U��s�q8��KTzN
���S��i'g��iáL����^c>_�hۢ�=Ĺ��� ��������W��˹u�0�����Ͳe��w6��.�{��9{ww�a�F��m v*&���?�΋	��Q����j��r�?z�c����_������gS�%�˒Lq9�V�*l���X���)%FCgL,� ǽ�]}�CT�.,S���.���^ڶG{dZp���Ի���ϣ���C����
W��D�̴(ڭwQ>B�?��p/z�~����F�~��u��]5���!)�4��I�P��
�qlJ�[M�N[qCoN	V�2_7}a�D�"0)ƷK���ge< Y��ωዅ��S�(�q_r
��
ڣF���N�{y��3z�^E�8v���>�_;��7�=)����l�pa��$�.�թ��=-xrg��	�l��ԟ�s��Gy�Q�{3�����@3|Zr(L+�"m�K���uuo���*�$��K0ٔ�^��(CIf��=1ݭ�h��*;A�����\�}T�b���dϬ�ٛ��&}�b���1�kv~�9�}P�%�����,��sQ�"**&��BY�z�E���ʦg�����rt���g\��=κ���3�?>�y�%I��As�s�)��Q�o0˓ C&�)��c( ��>�0�+�p�����w����؋6\]#tf✓p���)DA��}*J��I�nx���)�~�ftٱlJUw}��ϔs�����������^���-̔�I�?�������
��xI8ZU�=�q�Y�����8��5FI&������f�pKC��"V�����;rU��
����W�a,��RRӥyR�$�%��0����8J����.6+_)x/��@��k��9D����@��vc�
lO1\��	#O����m?��]��T��9g�'̼Î&B�t02���
<�ǃ���9KF�"ӬX;Z4^R1���Ut0�������L
ӣףo9$�7*��l� U*M+��{���!B;D9�M�i4V]�>�����BY6;��Ӂ
w���U����Y��$J?q��;�+�裰.�؁��j�i<_F,:=�c��U�T��U��֧8�����c��b�s?sg5P�;�yl`v�l(�˚�s��Tj�ç4B���A���Q�H��Z����#�B�,Sc����u=N#y�?~�I�xک+�3�t"�FgA�&��H.F�D�R�.y�W&D�t�Bӳ"�,U�U�-�Zq�{S�47��L�W��"���C��Zy�-g-�����    �A�t�pFSZEw�G�$�������B�!�i2�T��g{j�5Ҟ�>:��F=��{��Q��u�P2����Q5sMT�����~N��q���ܡ	E�%����IJ"�����E��:�9W�m��GD��Lr'�Ο��7���:�B���@�ÓaU�=EV;!���R�oeZ?y�H��t՘��~�dX�?�;�J�ý��q�+e�,��V�'I��?Ws�OjHk�ocOidHD!.���y+��w�U�����3L`[ݻ��dBR�[���������a}�i:�Yx�㮌K��=2)�	��8=4'Eƹ�D�� �5W��/7+��۫ϥ#��G9fA�I�j0Bb��I�]�w�L�DBSfy�cݞ��%]���4ԡc�U�XV��f
�����w�Vʶ)b�.2���u�$P��BJ���u�����I����`�wa�ʔ���|I�I�Z�����Yu�T��[��!i8�k����e���=���>I޷�ч~~�ᨘ�I:Jz'��F��Ϸ��8Kc�8����4\�by�
$_����&� [^RI��ǅA'_���q9��%�'�?�@���w�U�S���Dҩ��Q��3ȡ�5[椣Hh���y���}�+��^�����%�\�8U�D���I���� �m�
W*�,��D,��y�l
�)�k'��A+f���Vf��9�<N�0����뷘�k��iW�:ٔ�c:�ZT�f�����ɧ�����}|t����߄_���
���j�2�B?)��}U��2�Ó�Pm��9��V�OF�J��X\�<����[�&�J�WW:T�,��S�[��Ò�58T������y��R�4�1�ERV�➾�@�zTy��Dɲ�$]��ptò�FK���6�z�G��#�`A(�(5���S%��lmѰ\�yA��&R�G���.�M��/ǿ����~���ܯ��Q�K��h��B�>tXGc���y�=�;�<��0k��#�z0I�(U��뚰�j����g]�W����y�6	�{�Ϊ�y�5���ԁM �;!��g�ҷ�0�扉S�-8i�P�R�6�m5.�$a��	0ܡ��"�v롣�9�(rn��O���S�Q;���Ƕ�U��S�B�7F����z�	ˢ˖��(��x����D ��x���07�G�sҊ��(w�E�fx����)5��(1��-鉩L��Ј����`1u�$c�-�4���8۰�ZT�`�	M�/�U�ٚ%�hP �����3!T��%wK�K��-��������"�N��vM�T]/�~ִ��� Ǭ<QO���S5r��F�*�tk-��G�5�a9�ڵι��~VC�p��2�DmΝ��n*�=�8f���B:wѿ�՛B��D��ȑ=������m�s���xT��a�[��i����8��{��N9O2�f��:ʡ�3��g�]��¸�j��V<!5:'P���5aΔ�N)T���aF"���nB9�>)�~�
U�J�j��f(WH%���H���+ѻ]t,�3��p٥���gR�+�S<��(/v�m�-Z*�7g^�D\!�Q!h��E����:�(LL�@53\���V��\�}���Oٶ>A�W4^�u���X�����)�����a$��/� �F
���������U=d��
/�/��k���I���4"8:�ۜa�t��H�kW���*���/�uv�1/A<��O����dRE4���NA]	�8�[:-��_�DQ�������2�T[Wu���ǑԈ�:}�j^���H�d8'�P�fe5�5lr�	p�\Ogw�:�3t� ���K�D�g�;g����^�#�	���3O�'5�q�45Ӧ,��/��!H;��i�aiiUoˬ(��V��+�I�zZ6jL���^�Td�:�a��8�ﷺ�ڙ�����^�Y&�E�b{g�$Ds�m�����R�$=sv�#�~����E��~E�J�Oe��v<Z�l4�Et�ӣ�)�zw2��U���7uGS�W���|�d��3�8�v���M3%�Ok���L��Z���{�������	�$27�{��K�A�g��7'���\bP���A��m�:K�w�������Ҋz�w���gd(�6����u<Qe]�8��"��d�-����O��ӗe����5�{�4�;�����W�!����.S�bpn��*��5f8��E7�ΐ�C�L�N�o�B������B
�:��<�h�K�^�Y�ϴ��2<�$:S������J���f/�Ԑb��1����v�M_�4q����lJӬ*�`���&�"� �K�\U����Ӄ��	g:Tj�!����S�T��zC@�0H�2�1����re��Eg!����kx�=v�la�y���bY�N6k�v�O9����'����C3pm�䙜[��ǉ[��ɞO	E-e�4�T���!�L�����MW(�k��d��thRp+�S���Dه���_��E��P'�e�}C�b�]Oӄ[T��i�C�qw�Ƚ o�ݵ�n�&u-��ֱ��������z�C:o��a^�p�r��yE�&�V�~9j�p����Y��޳C֓RA0�U���1BA�K���V��/�<U��;�"	_9Ҙ*̈́�8�K?篪7��E����y�DD!nR X1�:^=@������l���-�H(�4�:�R�����ۗz�����z��0��{�PpOU�B�u��I���Cq���}�U���at=�j#��^�rSVM!H�D���(1C��>s�҈cU�vER]wk��TR���b����vD����N:G�����jאV� H9�<T#B��U�������	5_��P&H�Ƕ�m���L����o(n���ޤ�:jfIi���9�x�+sI�:�t���E� ��/����La*I�yK�`>k�G}�*t��s�N�(n�H�N%(�OY�S%t�|�ޟ���ŧ^و�ׯ�^�p# �-{�-�9�ط���X���&yq4��1*iiw|������	(9j���|hC������l+�\�a6���;Bls�H{�Q�=u��M"<��	;��U��Sգʅ�5�b��J|"H�D�ð����B�qN+��u�L���:�����i������Fbw�"Vi�#HL���n�w��R�W����ȑ�΃��
��j
���@y��R�ۥ�.^e�dS��j��{ֽ��iC@����4���wq��D�|J�)1�1|J�#�5�������I�a�6%��KϬ+�*U����� B.��s�Z��s��|��ʉ)���V4L�ש��4*�Ч6yf:���KOT�/�����O���j����{�<����IV�����z!
ieU��M���O�[�5�4'�vx9��%h����y����i��ugp'��h]薳Ղ2�(0�*��K���`�����������~�c���[�7�����d]����;K����f���"lIp�,��dIt���Kϝ8FG�c�;6fS�R)[����B�|>�^���ϒ=�16..�.E���2=j:�w8�A[ u��&�ai� Ƕ��/���x��ι:d�Ӫy�6IZ�[�]�{�CἮg`��X�}��դ�h\�5ի.��>���;H��2^,�C%�}g悉.�Aq�#$�(Fh�H �ovw�� )�{�.j��8!a��ÄSپS�v�O���F���+�tɚ՞^��az4��:���Y�Ɠn.��r�Jp�*�4��J+����f٢�%�(B�6��%v�!IHܩ6EU�$��5����8�VT�$!��J����>���K�3c��J�2�'��)kW(���!@����f�����3����%=�q�-e^�ϣm��	�v���]B5Mh]�pVS����(�!ޅ�>�O����tϰe�(�H�]�.bu����H��dQ�z�Ls�{8�ğ�q1��P��\���ml>&~�Y�ۗˢ#�)ھ�q��f0�D��4�)*�+v�`�i:��&��֝�]�8u���4!+jq�V�v
41S����)I`kȖm�9�ʣQ��y	�Ǫ�;ϯX!줉���a���;(�*o�G��:�1Æ��,��]V.    i�2��WU�+P��1
~T��P*��nu9�0;0�����]#�ho�>W�. �]wȡƛ������)Ct8oJ�i��^� D��ңS�AUE��Kh����;����Ǥ�k�.M:T�'�u�tDUMb�6d"Ϥ��(Y�3���A���!+�j��R{���dʓ��:���\�r��Զf�����-n�=��ʼ��(gy��h�#��f��h��S�{m,�z�rV����1��?���Ł����j��b�کnE�3�
�oiA��ߩ���d�Y��_��a�y\����z�n�-SV�Ǐd����-�9��ڏ<r�.�p�h�`\*ꥬ�&�x[V�~����IH�V���++St$��]�u	��#��<�KÏK����<"kd"�U�~6bq|��_�_>B�(��?Y���R���m��Q�5,�Ю}�2Yj�+n�t�8�گau�;5�+���yu�}���a�L�D�D��2�@�K�e��U�W�1�w�B�.	�@S^��j�����B�\�I95(wC ^B*B��U�ɥP�ݼG%��VG�9�%�fYS���RC�t�xd#�R�s�(�	���W�J!�r@1���Y�����8$d��w��ć�e)+�"�W�Oq�ޞ���y������}��H"^�C(�7�=�~�t��S� �N_.��'��N�窰�/]-�a6͊U��o��u����19��N%{��܉�|���J�eJ����d �?e��cq$��(tig%�O�KeS�KT��)��L⡴�[��?"FY�Z�Ж�����7"���j�4$��"�\<�-ӵ�^z�5�^)<�݉u�GlV���n��׶��Cf�V!.)��M���\X�u��L�ǣ�H�����%r��Nqt{�G��f�2#���p��sQ���9��UTt�f��^n���� *=mc�w��x�K�KjN��C��_H�W�,�|�\P�������m���w<3�Y�~ǅ=�)�nP�	�Y�wŗk<���G�n��Sw��˄�i�'s��,?�Q������)i7�z�O�,,��xZ���$L)�vMm�#�A����X�I�a�:�Ұ� ��_�|�_~ K�T�[�G� �ɦ�e���=���t(F�F�Qÿ𧪛쾮��y�K?��J�~��Ga+Ҥb�d3Oʅ�X0j���S2=U��ymU�b"ɜ����d�Ɠ��%\e_�/��\:=AS��7�D$}�M���1���� G�p	��ӈ	á�pho7h�@U����ޙ�̕#W�ٵ�r&7����/��f*5���Z��_�w c`�A/�YT��?�y,�
�2v3�4��!ƀڪfѱf?f�xH�<����DD^a���Y�7�۠j}��&&-��ڛj(��W��!߳Q;�|0��0gp�~�?x��*��_�*T���)ѳM`�yX�aԎ��r̂��SЬ�W;:�؅�b�ڝ#�S��d���l�3ܺ�T�V;�YBcӧ���C����,$�<֥� ����av�P�L&��N$�_�Ԓì���4j�%-pH�Pͦ7۽����s�e�f]N�1���x1/���T�>�/��� Q�|+�������6$��T�b�7t���	�D}�s� yuUEehHjupC�h#�27��n��	�q6��b�n/}���l������I��6���t�+o�C�۫�U���Fpa��0�S�N�0�{�PMk	��H�;#dzC,��hU��ۣ҅�7�o|�cVP��gd�u�H�znf��KiM<�O��ј�XK�w�;&95ۿr����h�M�~(���| mMj�[cX4�L֐����AT1Yk%�7&b��^|vF,a��H@*�p�N�
�x�*S6���I�O/H�Ӌ�}@b&�2pau���#(zP������i
q��2����I�W4ʅ#t��*E�KȂ�Ӱ�['�iw�"�V,���i���EIš���
�^�� $Օһz��L9b�d��R�Wلk�	�a#X)5:O�Ds`��h&�z6oLL��"��,PQ=�B{M�j�P��ѕ�4鰑��� ��.��g�ԗ�i����a�sS���'�Um�ގ^=�mg|vL�\���B�V�ئ^ay�\.L�EL~��� S��8��M(�<w4��S�(��*�b��#��Ux��PIg<��^,�Vޯi��p�ZS���X� ���[UZ,N1M�w«AB��*�@�a�Ӽ���cB�h.�Rk�)6^@D�H�f4�=�D{#(&z������I�{���v��J+fu{b��+!E��"����}xӢ��8��Ƽ�fB�r�/��<&95�%ƫb0(�{Z �I�//UtH*�>� �IjHc0���<΁���a��Ң}�n��'��]���� �%�E��`%�٠���9��6~R�J�20:�7_8�d


<j�r0���=Z&n����(��
=� 8�ʙ�h�iŁJ�)��tƖ�ჭ)�Er�(ɯ`u s�?�4��>.N˩��̩�j� n@՗��� {ӛ�9�(���#�;�;jXXD�x�#*Y��xpjps"���'ↀ;��XD,�����/���v�Y11f?y��B��m�h;G�ᖞ�z����e`^��z�>܁c�c��֭�?����U��G)@Eu6�Z��3�ݮ�W��r2ک���r'�	�8����T.1�0���&>5
%���I��4�*�h峀6�GHb�#k{����*&� ��0_/=�nu���M���]+^�u���)�ñR-�0�<�e0�_*��3����kU��U���t�����1�i���?f<�����p}1��S�����s�֮���/TG��t>TuvinD�]�5���C�ё�y�wZ�;2���<!|�����׀:Ƚ�
(X�v�da��=��*g�.cGd�m
N�w��R� �6�Ȃ���T��~�kh��D��,�f�j�[.����t#����ф��E��ΐ�iދ�]1����J���FSm~���fE��?C�7
���6�Fv)�����M�`���P�Ag˺���y��ic��QU�v3���>L����q�� �& ʁ&����ɆTr������Zy�:���y�^��a6Γ�;=�ڢ!��
9�����8\T���u��-�|�tT{P���u�BW5ʦ81�ٯ�0���3p5΋�8�� qb#8���N����t��C^��ishW����OF=����M�'�Ѱ�e&�vtCb�ZAH��c�tD���>u�����ѳ���Ьt�ը��d�8ԅ�
ZA�6| �2�d���0�WEC{�(�Q�.�u%��rop�����Pmyuz��bB�E{�)�C�pVm��g��0S�-P����}�m��x�(Ⱥ� ���PИd`O�n1ST�>�`��Ndu�	�$@C�3�aZ�Uz� h Eyx�=�͌��C�t�g�Qak�<ҡ��r��E���\�!_nK8�hj{N��*�L��k匷�W�UP��]Ѹ�,�t�0�H���np��§��,u	P��FX�yx����z�t�L���.<�;ee�R��v
3�	��!\F7���Қ��Ꭸ&�)���j ��L��:�ajU��PB����͎�X{a(X��*�Z����uy
4�wF#M��92�Q1=�9�3̸�Y��{�d�"Z$ƴD�UU3X�::�6��Y�F��� d�
���7|?<��w�����d���d�nZz��=2�N��#�$	i��;����R;N������b�J�08��9�Jdk%d��s���@m.g�|$�o&$I�ޫ�V��`���po�ASn	^O,�D{nH����Ty�<��#��j�*���Z	09�Xtp`˘��NdG�m�B�nBdk S{�+��l�V�d�@;
ڝ�k��O�c<
�	�5'W`_�������݃v,������<������P=N����ZX0�'��m2��	�    i� �p� 2_��gDa~\{�|�}?f��a��,�1�nFV��'X���E� <�PU& ���ʉ�\U�p�=�nv]qW���1o����O2�
h�H���pf�z$�� ��Iȟ�uPP�4���8��\��
~�r#�#�1m��������*Г=wm��
��EP=a��`x�
m
���8F�C[�#3�ϟ
`�2�R��I��V��>ҧ�9�Z�P(az�̢.��Q�|Q	1��bbi����q[�^#`	�QYSE~�Ac����[��5D:U�`I+R8~~�:��\�E(�L	�oQ��Z-x����T�㰬��AHf�@P��j�Hݬ:f�,�=
����zkM�]n��38#PQ�̱@bY9p�Py��g�pAx
Z�^��Z�n4S�̒�N?�<U匊s��<�5���.ˢ�L*���j������g��S��J�&�̀�����2�m�d(��!T���������T�*D�0UEu�'`]U0J:�/�_3�����5g|}k��ǁ��R�nokZ��9�����`r��+��ܥ�+��A��JM5�`�z���G�zEI:�  ���/���
]�w�n�2�1��'��:�d*|շ;�W9��1 5�h�c:��u��L?�U=�q�p�CC���[����b����O�5��")\�w0��C3�5�P�� ��**��L��b&�g�
4C��@�".�^�<n��(���@GF���~�3�9��lQ|pz`Ҿ&ln���ݽ��pR���$��
È�9H�}�$F������Qtm`���t��A]��i$pRG�WK �̚sB�R٠0���Ӿ	'T&6�Ty@����JY��^���Ц9�@�CG�j�3ʝ�c�WP�����2!_7�BDb�8���y,��d�L����H�qW	�3-������2=s�d�wR�"�?2��B���+�ī�E���Q�� Ր�BD#���]tIP�����ujhe��˶�h.~ J�����;�5u��y8u�8�`43�N0㴊����B��5(�?���N��\R|Ӌ��!2�9W�:��wA��J}G5��U@;/���-���|��0kՈ��}��aN=�Z�f�o�e� ��m'eQ���4kr�S��q$��' Ԉ�2�P����7|���4�Z���3����U����o��r�@�p�4N��!W�����+bJ�S�c�J��LBԕm7`�����/�>Q�0�oe�_w� ��Fw��]�Aa�+�����g@jјenՄQM�jI� ��2�Ҁ/�%��*
#�̡ſ(H�1Q�xq_�nC����n�|�9�Jx��I5�Z��c���Ǧ5%��p�L�A�	sD�QA�������m̙��&�m���
-��`�ya���в�N� =|��_�A�D%ώl;�X�4
��=�o�0�6��T᜽�j)m�w0�Դhodp3Qm�rk�	\�Z����;�5p�5�V5M	�x�����͗@���l�D�B:���ĵr��4�#���b'��U
srih�&��Tm,���Mm�OA�K1�95�����|���*�
�|� �0���g��D��
����eF������0�����(��z���"g��@���ߊ��V˙�*c.EtT&W�~�Å��E��Q�-F���"�!�	�+J �	5�������Y{@^|�R&$LN�*Q,13��^�+JM��)�1
U	���r�"���MA1����e�벺�zj^<�x]ܹF�ss*{]��iG�#Cn���pZ�`��èc���0�QJB���N?��ku�3TS�r;͏vj��l�NG7ǎї��Lo�#������-1H�d�T���/�o$]��5Y�*�7��,���5O75MN�<���V063j	�'8t{x��⁉���'s>I [���ŢPO��h�n�M��jwB�oi*�]A����ԭe�؉*��m�`~��j�Q ���'S�L��������ޕ^��;���*�gH�~Y�=%�L0N��h��I��]r������1`P�U��q�g-��	a&N�!h�h��1/kG�4o�N�)p�Ԡ�Ω|.A�y\d���8������gq�l
!`�j�\A�@m�]�� G��,)�A&�I�G��6�%���~�0��O��98T{�g*�8�ogp�;��`�V���9UϨ��f>�
)�(Pp^i��m����i]Ю��߮�P.m�4L��cn�i�19�DE@+zo�����
s�9��c�G�}��s̪^98�4Ҙ�g4����fM���MF�kz�4~/WN��?Q]�[]m�ѶC9	*Z�+L��Wf������L�%���<s�0�(ツ�4�H0P�y<���_*� ��J[X��ѭ�9B�.��h�@X�(]ૉ$z4	칪���@�l��Q�+�EV3���y4:>ټ��Ug��
+B�,	����dE��A'9@V��t��	 <�� I`��8��Vh�E_��5e-���H���uPk�EV3i��х�Tя.�qX'�C�Z,5��j3�M�_M��� A���(	�	�m��A�`֛���bY�x+�"��=�J�;�G�?�u�{OUW����du\8acV�V�����U�&�z�HU��a�n6�·j{%�}�%�Ъ�2H��j=�8�`P�D�Ԁ	���k0;0�F�Uq�,3e3S�P���P����{ 5��$d�aMt�ڕ��.�X�X��aؙ�3�u���0�U�#%>�v���g�� Vk���r1p�l��p����Y����w�~��/_��I�K UT @�-��4�����pB�B�k2�3j��X����9T�pI��;�� ����0R�d-4wzD;±�БL�Ua)OEd�!;�CO�O1r����XkF�����X��cW���O0�����T��d���uAU��*�� C	���2= (��=Zp�*������� �X~�V�E�fv�Vƍ����� 6lu��r�璗b���s�4斷��0���JZ��S�0i�|��E��0e~����T���@��XYeczt
��t��p�J�=���č���I1��	E*]��Pq�-G�2�c����������}�圼�G�x4�(g�sj��ʈz���	����;yj�7MLj|�P�\���w�*Ԩ������Q�)���5�av�P.�K7�;ɏ��)��,3kp���C�(��İ��Rm�-i�0wE`�u�NVϤ���*UM
"����f$��Z���iS�4�ј�J�L��	jM%���:h$��c|Jg0���q⁷�-��5��% ���`R�����W@�~>�j��G�%ഩl�P�Tۈ`�9�d�7&Z��	�ك�ymZ��]u�����K��s�Ʀ�0]f0�==s�U�[�D�-;��Ag���I~�zn>���U��OF�����K�J����/����?H�s(g{E+���#���h�?"h����5��h`b������ ķb�j�nc�NU���&�Y?�]�UF*�QQ}z֕�����}U��6�b�w70��F�FI��8�@��,70�7�m�5�L�rUS�>L��4C5FR�t8$�4���VcL#B�܋Z��{�/�X�*JX�Z�(��O�@�N�/��0�c��{p��� �.��l&�v������y���Z�kQ��I]&�۽�>*|��G;�
y�w��~��3�}#Lav��T���o�xsx�� t��� �����h���c��ޫ�u%Z�?�Ο���މN�9�)�5�[��~#2�՞>��Ƌ��?P��*��d�1U��_�B|g������ÿ�С)�-�,�kq�h������z�dײ.����]F��}�>�}e8��͹�����k������ܑʚј��e'��r����>��I��&�ĺ��TЎ���m����2�/q�|�ݘO|@1y�����jn��?#�=�|���a��^z� �  C9���s���x���ԫ)پ���o���o��-�~Y�ڣn!<H+�nj�ű�\�G˰�9�H��8�;z�&,�!	��;��v�T�����W�T�n�=W�䷵3���S�?�z��n�ڭU[1���y�= i�#ַLt�;��*�uT"�����sP��:JVտv�U�����]��?F���?�W����wL�+r�_������tF���~�I �n���1�>�K_1��=��������7�G{j4[��lrh�Zc�_�`
�F���+��Wo'Ė3a�/����h�B��5����vս ���'(�y���(�tcR7���oq�{������6ݰ��-��YѨ��m����2w�/q�[��t���z��U����=}�l���nR�L_�ݷ:��5|�VPĔ�����.�:P�����R-|�I��ſ��?*�_;�ݯ��{ܠ�R���ڴk0oN��"���(��«|�w<������5k�w�.[o��{Ц���Y�`�e|٠p�׻����U���SC�����ڬF^�,�\��2��Lm3�Z�����i�X]]-a(V����ت&�|�P���/�����c:�L���e͆`����ԗ�8;�c���#��C��~+�SdiA�w�bܱfXM���Q�E:̊��at(2N����b8?��4?�0�fu��<oug����c|��s��������߿������dX��T���_l�G�������?��������_׋��      -   W   x�u̱�0D��L�>
:acf��s�r����[4c3 ��?��~���59�q���fEC{��v��f�+bWs���Q>���_��e�      /   @   x�3�0�{.츰����.6\�p��¾�\F�����
6\�ta�Ŷ�<�=... � a      1   6   x�3�0�b����.6��.l����ދ�vrq^�vaPh����� �>N      3   W   x�34�4�?0�eh�i�p��!^XxaÅ�v\l����&��/6_�}��b˅��\0,T��eh6�h�1p��qqq {A*�     