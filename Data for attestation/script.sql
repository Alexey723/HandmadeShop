PGDMP         0                {            handmadeShop #   14.7 (Ubuntu 14.7-0ubuntu0.22.04.1) #   14.7 (Ubuntu 14.7-0ubuntu0.22.04.1) 7    [           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            \           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            ]           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            ^           1262    16448    handmadeShop    DATABASE     c   CREATE DATABASE "handmadeShop" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'ru_RU.UTF-8';
    DROP DATABASE "handmadeShop";
                postgres    false            �            1259    16532    cart    TABLE     e   CREATE TABLE public.cart (
    id integer NOT NULL,
    person_id integer,
    product_id integer
);
    DROP TABLE public.cart;
       public         heap    postgres    false            �            1259    16531    cart_id_seq    SEQUENCE     �   CREATE SEQUENCE public.cart_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.cart_id_seq;
       public          postgres    false    221            _           0    0    cart_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.cart_id_seq OWNED BY public.cart.id;
          public          postgres    false    220            �            1259    16457    category    TABLE     [   CREATE TABLE public.category (
    id integer NOT NULL,
    name character varying(255)
);
    DROP TABLE public.category;
       public         heap    postgres    false            �            1259    16456    category_id_seq    SEQUENCE     �   CREATE SEQUENCE public.category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.category_id_seq;
       public          postgres    false    210            `           0    0    category_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.category_id_seq OWNED BY public.category.id;
          public          postgres    false    209            �            1259    16464    image    TABLE     ~   CREATE TABLE public.image (
    id integer NOT NULL,
    file_name character varying(255),
    product_id integer NOT NULL
);
    DROP TABLE public.image;
       public         heap    postgres    false            �            1259    16463    image_id_seq    SEQUENCE     �   CREATE SEQUENCE public.image_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.image_id_seq;
       public          postgres    false    212            a           0    0    image_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.image_id_seq OWNED BY public.image.id;
          public          postgres    false    211            �            1259    16471    orders    TABLE       CREATE TABLE public.orders (
    id integer NOT NULL,
    count integer NOT NULL,
    date_time timestamp(6) without time zone,
    number character varying(255),
    price real NOT NULL,
    status smallint,
    person_id integer NOT NULL,
    product_id integer NOT NULL
);
    DROP TABLE public.orders;
       public         heap    postgres    false            �            1259    16470    orders_id_seq    SEQUENCE     �   CREATE SEQUENCE public.orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.orders_id_seq;
       public          postgres    false    214            b           0    0    orders_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;
          public          postgres    false    213            �            1259    16478    person    TABLE     W  CREATE TABLE public.person (
    id integer NOT NULL,
    login character varying(100),
    password character varying(255),
    role character varying(255),
    address character varying(100),
    email character varying(100),
    first_name character varying(50),
    last_name character varying(50),
    patronymic character varying(50)
);
    DROP TABLE public.person;
       public         heap    postgres    false            �            1259    16477    person_id_seq    SEQUENCE     �   CREATE SEQUENCE public.person_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.person_id_seq;
       public          postgres    false    216            c           0    0    person_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.person_id_seq OWNED BY public.person.id;
          public          postgres    false    215            �            1259    16487    product    TABLE     '  CREATE TABLE public.product (
    id integer NOT NULL,
    date_time timestamp(6) without time zone,
    description text NOT NULL,
    price real NOT NULL,
    title text NOT NULL,
    category_id integer NOT NULL,
    CONSTRAINT product_price_check CHECK ((price >= (1)::double precision))
);
    DROP TABLE public.product;
       public         heap    postgres    false            �            1259    16496    product_cart    TABLE     f   CREATE TABLE public.product_cart (
    product_id integer NOT NULL,
    person_id integer NOT NULL
);
     DROP TABLE public.product_cart;
       public         heap    postgres    false            �            1259    16486    product_id_seq    SEQUENCE     �   CREATE SEQUENCE public.product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.product_id_seq;
       public          postgres    false    218            d           0    0    product_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.product_id_seq OWNED BY public.product.id;
          public          postgres    false    217            �           2604    16535    cart id    DEFAULT     b   ALTER TABLE ONLY public.cart ALTER COLUMN id SET DEFAULT nextval('public.cart_id_seq'::regclass);
 6   ALTER TABLE public.cart ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    220    221    221            �           2604    16460    category id    DEFAULT     j   ALTER TABLE ONLY public.category ALTER COLUMN id SET DEFAULT nextval('public.category_id_seq'::regclass);
 :   ALTER TABLE public.category ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    210    209    210            �           2604    16467    image id    DEFAULT     d   ALTER TABLE ONLY public.image ALTER COLUMN id SET DEFAULT nextval('public.image_id_seq'::regclass);
 7   ALTER TABLE public.image ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    211    212    212            �           2604    16474 	   orders id    DEFAULT     f   ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);
 8   ALTER TABLE public.orders ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    213    214    214            �           2604    16481 	   person id    DEFAULT     f   ALTER TABLE ONLY public.person ALTER COLUMN id SET DEFAULT nextval('public.person_id_seq'::regclass);
 8   ALTER TABLE public.person ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    216    216            �           2604    16490 
   product id    DEFAULT     h   ALTER TABLE ONLY public.product ALTER COLUMN id SET DEFAULT nextval('public.product_id_seq'::regclass);
 9   ALTER TABLE public.product ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    218    217    218            X          0    16532    cart 
   TABLE DATA                 public          postgres    false    221   �:       M          0    16457    category 
   TABLE DATA                 public          postgres    false    210   ;       O          0    16464    image 
   TABLE DATA                 public          postgres    false    212   �;       Q          0    16471    orders 
   TABLE DATA                 public          postgres    false    214   $C       S          0    16478    person 
   TABLE DATA                 public          postgres    false    216   >C       U          0    16487    product 
   TABLE DATA                 public          postgres    false    218   �E       V          0    16496    product_cart 
   TABLE DATA                 public          postgres    false    219   �M       e           0    0    cart_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.cart_id_seq', 34, true);
          public          postgres    false    220            f           0    0    category_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.category_id_seq', 1, false);
          public          postgres    false    209            g           0    0    image_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.image_id_seq', 120, true);
          public          postgres    false    211            h           0    0    orders_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.orders_id_seq', 23, true);
          public          postgres    false    213            i           0    0    person_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.person_id_seq', 12, true);
          public          postgres    false    215            j           0    0    product_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.product_id_seq', 24, true);
          public          postgres    false    217            �           2606    16537    cart cart_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.cart
    ADD CONSTRAINT cart_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.cart DROP CONSTRAINT cart_pkey;
       public            postgres    false    221            �           2606    16462    category category_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.category DROP CONSTRAINT category_pkey;
       public            postgres    false    210            �           2606    16469    image image_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.image
    ADD CONSTRAINT image_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.image DROP CONSTRAINT image_pkey;
       public            postgres    false    212            �           2606    16476    orders orders_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_pkey;
       public            postgres    false    214            �           2606    16485    person person_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.person
    ADD CONSTRAINT person_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.person DROP CONSTRAINT person_pkey;
       public            postgres    false    216            �           2606    16495    product product_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.product DROP CONSTRAINT product_pkey;
       public            postgres    false    218            �           2606    16500 $   product uk_qka6vxqdy1dprtqnx9trdd47c 
   CONSTRAINT     `   ALTER TABLE ONLY public.product
    ADD CONSTRAINT uk_qka6vxqdy1dprtqnx9trdd47c UNIQUE (title);
 N   ALTER TABLE ONLY public.product DROP CONSTRAINT uk_qka6vxqdy1dprtqnx9trdd47c;
       public            postgres    false    218            �           2606    16506 "   orders fk1b0m4muwx1t377w9if3w6wwqn    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk1b0m4muwx1t377w9if3w6wwqn FOREIGN KEY (person_id) REFERENCES public.person(id);
 L   ALTER TABLE ONLY public.orders DROP CONSTRAINT fk1b0m4muwx1t377w9if3w6wwqn;
       public          postgres    false    214    216    3252            �           2606    16516 #   product fk1mtsbur82frn64de7balymq9s    FK CONSTRAINT     �   ALTER TABLE ONLY public.product
    ADD CONSTRAINT fk1mtsbur82frn64de7balymq9s FOREIGN KEY (category_id) REFERENCES public.category(id);
 M   ALTER TABLE ONLY public.product DROP CONSTRAINT fk1mtsbur82frn64de7balymq9s;
       public          postgres    false    218    210    3246            �           2606    16511 "   orders fk787ibr3guwp6xobrpbofnv7le    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk787ibr3guwp6xobrpbofnv7le FOREIGN KEY (product_id) REFERENCES public.product(id);
 L   ALTER TABLE ONLY public.orders DROP CONSTRAINT fk787ibr3guwp6xobrpbofnv7le;
       public          postgres    false    218    3254    214            �           2606    16501 !   image fkgpextbyee3uk9u6o2381m7ft1    FK CONSTRAINT     �   ALTER TABLE ONLY public.image
    ADD CONSTRAINT fkgpextbyee3uk9u6o2381m7ft1 FOREIGN KEY (product_id) REFERENCES public.product(id);
 K   ALTER TABLE ONLY public.image DROP CONSTRAINT fkgpextbyee3uk9u6o2381m7ft1;
       public          postgres    false    218    3254    212            �           2606    16526 (   product_cart fkhpnrxdy3jhujameyod08ilvvw    FK CONSTRAINT     �   ALTER TABLE ONLY public.product_cart
    ADD CONSTRAINT fkhpnrxdy3jhujameyod08ilvvw FOREIGN KEY (product_id) REFERENCES public.product(id);
 R   ALTER TABLE ONLY public.product_cart DROP CONSTRAINT fkhpnrxdy3jhujameyod08ilvvw;
       public          postgres    false    218    3254    219            �           2606    16521 (   product_cart fksgnkc1ko2i1o9yr2p63ysq3rn    FK CONSTRAINT     �   ALTER TABLE ONLY public.product_cart
    ADD CONSTRAINT fksgnkc1ko2i1o9yr2p63ysq3rn FOREIGN KEY (person_id) REFERENCES public.person(id);
 R   ALTER TABLE ONLY public.product_cart DROP CONSTRAINT fksgnkc1ko2i1o9yr2p63ysq3rn;
       public          postgres    false    216    3252    219            X   
   x���          M   �   x���v
Q���W((M��L�KN,IM�/�T��L�Q�K�M�Ts�	uV�0�QP�0�¾�.�]�V��xa/���i��I�I� �^�ta���;����[.l�����`�P~В]6�a�ȊX������ {p�      O   [  x���ϊ�7����K��d��f�EÐ�If�����C2ӄ����VW���6�u�%�Α���?�|����|�k��y]���o?�Ǘ���������˗?���?��߽��o��?�|[���7�g�69��N�X���3_��и�^����7_��?|zJ3C���b�g�f�:sN�R��t�u�Z�Z��;�Lm͑*YK�����~ě�{�*Ԛ��M5�V�NI6gI$�s���{�Z��&�mi�D�P;ip+�X�1N9L|��@�ٴ�K\%�W���p��s�mn�\Y��
�Ӣ�u��7�я�E�\�	w<��Z��=r7�4�7*���RӤ:S.cL�Z���,F!��l�e�'���N:k6>jz�\#ȑ9��=��Q�*��n�J�;�d���y�\���2k��7��I�Ж�2Yɡ�������0!)-�q���kr��c�qr�����
`Ӊ1��f�=�,}����I.�R��=)����tp�z������k�Mr����[*�>Z�����XAMe�f7�`Jk{�I�=4�Y=M� 
Xk-4��q�~�Ok_f)�&P�R��L��d���A�<�*�id�+eJ���Z|&��z�ø�B��G�i�M-U�a�I�-��-�����	=����+�2��ua� ��Y�e՛�2y!�7H����)��Sq���<W{+`yZ3 C�o��f��]�N%4o�cK��>� �)Mv���t��aB�6K\�
a����i>p����c���O�oK�����#�Q��k��T��`w��w̢��j��%����B��s��lJ����mu�w�O�or����a4B�i�'p!�Tꢺ�՟�����C2-�^tMAfk=�3"-�I.P�0*���,\�c:�LJ�m{߼[����@�X�ף5��p�Bp_r)E@��an:]�0��WtH/�Pu�qПSJ9y�>ٯ�nP�i�`Mn�s�m��7C�. ��9�d�a\��=�%�G�.K�h�9jڴ���e�$�ѹ�u$�vb��i���*hj��:]{TPQ�=���h	�A����u�$�A�\6 R�a�.f#fi�d0�����B�}lL�m�>=a����8��C8�:r�#�ѵ�"ǰu��
�Z��׍̶ݾI.�ueoǌ�Qp�C���AR|�G���#�A���� ��L�+c|cKk6�.Vn��T�7�q4����Y��)Jq�}_��9��ӢA�ᙈ�(�F�H�_�Dl֊ G%��V��\�/��@Wi8���fU����MrA���z.Ө���@�p�=V�Ի}�蟗~���V1� �V��v���2�K��&3��8�\�Ӊ�0�vTi[��g}Z��3��^a�����0����}�^�{����KJC� ���M����I.#В�{���� 6�E+����v��a���\���0IG�Ţv-#b��o��ldi�р,fg<A5�b˅i�g��_-��b'���� V9�]d�$<$s�������a
´/�#
�;Bx�`s�6�=��&�aP>j%��?�i좘i���$��.���rl ��RRQ'�I��.3#�΀�lC��ɴ	A�e��6��o&?�rhA��1��!��7^HW���b�`L�{�0k!=P�P�CnN�sOe�^��qn��x^�`������4�~{���#��m�d�,����}�^]����9��]z��U�`YAl�?��`���x� ��
���ӏ�LcD��O�w'Ę6& ���Q9�c��C/(�|;a��bV`K���:/Wq��z���%B��������5�� �*�u�^pfV� �Z�AQ��<���-��x�����q%�      Q   
   x���          S   \  x�œ�R�@��>EΨ3dAb�b���!�rqV�`4��]���C�tz�C����X��
�7�G��z��������|��h��/���]}�2�fm#!8^�v��k{�s̄����%�`�I�MYs��b~P}ܤ��!vmN�ț�JY�M��0����,�t̀=��tja��&9*׊�����$뒕r6�jQ&�F����N#�v�2��7P��T������o�$c���~�߂�A���#̰�e�QgV]�y$N������A����p�x��!6�~*��i.��m�6;O8Jud(�k�Y^%��.�e~Ж��GZ.�
���M�D�ucK1�%�Yx���D˽t��:o!����'��6v���W�
��b�&a&�Tn���Ί]w�.������+�au�+�|)>�(��)������.\w:����$7޳H���;��|��O����!~}�û�4�B���+���U��M�-�g1��J(��_V����/���K�z5���V�-�RS+յ�2�a��JIQ��l����8�׃�G��;�³���'�f�W�Z��������~P<����MM�l�Q      U   *  x��Y�n�V��?\h�h�zZRV]d H�&�6h���6��,��_q;�E
$iݠh��iѦ)����_�t��%EJ�ᦱW�XysϜ93wt����_=Pw�=�R�<��Ig�^Y}��liM]�,[j���Ǐ�:�?�����YY�<��R+��%z��Y{BK4껧�?=�,�P_q�����zűԵ�S�.8��rC��Z�]o��\�׮�[��v���⮊��c=�Б��}��J���u_��w^[�P��=֑����c��=~c�J��Ѯ=?7?�ߝ7�M>��]�~D[��uL���43��%üxW�*E�tH�i|/zz�Gxo�h�A�'&���a���"|јϏT�Q�'��l©�ԝ<Zo��ҋʍ[sw.σ�Y��Ֆݬ7Z�&<��t�t۪ڼ�Xel�t�?�AzH�0lr��Y�����s>�/�Dh�>9&`��Q�&U/��eK�{x�.��F\���>Sf ��M�{�%�Eth��/���D��k�x���Խ#z�5z�>}��������M�@��~��!�����,D��1�?���y8]����x�����N�&�����]p�g�lUϲ��p6󚆯�EG�]��!�B|tA:��2��]x��	��e}�k�����2]ʗL���t��t);��/F[�uJI�J���h4Dl��5��=�I���E�q�����ZtF\�B6�����D3P� �S&q�e�@�x��A}�*���8�x��	� měBR��[2�s�rڗ=�z������DC�@�`v��Ĥd���	������}@l�=~�s�PY珄!�:~j]��i�fm!�|
hB	XF�d�0�-4P,��i�I�i��6���:!�����7�|:H 9��yǜ<�n4�ecR*����CFh�M�]�帠A&���� D�m�v���J��!NQ�k"��'������q���a���#y���g��/�4���l?���m�x/�'��E�Hp1�wX�,}I��o��D��١���#L;��[_�n %�T�Fx9Xܔ��1* ʓ��o[�dj��S�n�˳�Cn"����4��X��L�΍�I�M]�hM�p�Ϯ@*�ERYoڵf�ڪC*��RY�Q�o���&�{ �S8��~���g��ldD�hE� >�r0�-��:$h#�;�1P�dl�+Na/�@<E \�ͬ�11��W����--7�̑�&��g��G(�pEG(AlҺㅉ�)���3!m11����Y���5�v*�(�N0)����0$7Su�M��� 9�������	�ȳ<3��KX��t�BQZ�u�ͺCӑ�"�>g�%bu�}�d�̍L(��)�9-J��`�bx?#���x�|�-��&���xGI' �����w���a���kn�,Ӕ��|�������F�����)�}TRlIQ$+PL�Ʊ46�E��x�R�,��	�=@$�4i��F]T۸uM��,_A�-�Fw(�f�i �~F~��"�I�H�?�p�{�iC��������g��N2���~d=W���+��;gO�/%"H1�a��S�Q\*�{� �o��\��U���-;z������A�H�l%�JW�&E+��b�&ۡ�����~)�S�t�ZV�)W���&u��GF+�R7Y ��+q�^��V8�'�丧?�BS+J�ɴL�9��W���h���]-7�)� ��Om�&ì�;m�t�ڗ�쾙6o@�Y���fk��ɵUU%s�l/:������$ K������n�-�xp���ݍ6��C�L;�[�|�+�3�����y8��N��W?a6�1J�;?Ǭ+h�ׯ�Y�Ɂ�[ۙn��bP[��-d{̳ĕ��gr��2�)�OTRn���w��f�Z#�Km�}���j�W(��2�U�� �v+_mN��j�\���Tc�*b�<�f�P�x�\!�K5}ˀ��gⅢ�n`�8�Ts���bd��m��!'�=�pH�g+�Z���q���3��0�Q$׋���|3�ʗ��1� `|\fɦ6�.�)C]�K�v=B(�N�~�R�S����V���g����$_�      V   
   x���         