PGDMP  %                    }            yemek_tarifi    16.8    16.8 6    Z           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            [           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            \           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            ]           1262    16470    yemek_tarifi    DATABASE     r   CREATE DATABASE yemek_tarifi WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'tr-TR';
    DROP DATABASE yemek_tarifi;
                postgres    false            �            1259    16526 	   favoriler    TABLE     �   CREATE TABLE public.favoriler (
    kullanici_id integer NOT NULL,
    tarif_id integer NOT NULL,
    eklenme_tarihi timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.favoriler;
       public         heap    postgres    false            �            1259    16543    kategoriler    TABLE     d   CREATE TABLE public.kategoriler (
    id integer NOT NULL,
    ad character varying(50) NOT NULL
);
    DROP TABLE public.kategoriler;
       public         heap    postgres    false            �            1259    16542    kategoriler_id_seq    SEQUENCE     �   CREATE SEQUENCE public.kategoriler_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.kategoriler_id_seq;
       public          postgres    false    223            ^           0    0    kategoriler_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.kategoriler_id_seq OWNED BY public.kategoriler.id;
          public          postgres    false    222            �            1259    16477    kullanicilar    TABLE     8  CREATE TABLE public.kullanicilar (
    id integer NOT NULL,
    kullanici_adi character varying(50) NOT NULL,
    eposta character varying(100) NOT NULL,
    sifre character varying(255) NOT NULL,
    profil_resmi character varying(255),
    kayit_tarihi timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
     DROP TABLE public.kullanicilar;
       public         heap    postgres    false            �            1259    16476    kullanicilar_id_seq    SEQUENCE     �   CREATE SEQUENCE public.kullanicilar_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.kullanicilar_id_seq;
       public          postgres    false    216            _           0    0    kullanicilar_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.kullanicilar_id_seq OWNED BY public.kullanicilar.id;
          public          postgres    false    215            �            1259    16574    tarif_kategori_iliskisi    TABLE     x   CREATE TABLE public.tarif_kategori_iliskisi (
    id integer NOT NULL,
    tarif_id integer,
    kategori_id integer
);
 +   DROP TABLE public.tarif_kategori_iliskisi;
       public         heap    postgres    false            �            1259    16573    tarif_kategori_iliskisi_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tarif_kategori_iliskisi_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.tarif_kategori_iliskisi_id_seq;
       public          postgres    false    225            `           0    0    tarif_kategori_iliskisi_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.tarif_kategori_iliskisi_id_seq OWNED BY public.tarif_kategori_iliskisi.id;
          public          postgres    false    224            �            1259    16491    tarifler    TABLE     ^  CREATE TABLE public.tarifler (
    id integer NOT NULL,
    kullanici_id integer,
    baslik character varying(255) NOT NULL,
    malzemeler text NOT NULL,
    hazirlik_suresi integer,
    pisirme_suresi integer,
    yapilis_asamalari text NOT NULL,
    resim_url character varying(255),
    eklenme_tarihi timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    aciklama text,
    yapilis_yolu text,
    porsiyon_sure character varying(255),
    hazirlanis text,
    olusturma_tarihi timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    kategori character varying(50),
    kategori_id integer
);
    DROP TABLE public.tarifler;
       public         heap    postgres    false            �            1259    16490    tarifler_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tarifler_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.tarifler_id_seq;
       public          postgres    false    218            a           0    0    tarifler_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.tarifler_id_seq OWNED BY public.tarifler.id;
          public          postgres    false    217            �            1259    16506    yorumlar    TABLE     -  CREATE TABLE public.yorumlar (
    id integer NOT NULL,
    kullanici_id integer,
    tarif_id integer,
    yorum_metni text NOT NULL,
    puan integer,
    yorum_tarihi timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT yorumlar_puan_check CHECK (((puan >= 1) AND (puan <= 5)))
);
    DROP TABLE public.yorumlar;
       public         heap    postgres    false            �            1259    16505    yorumlar_id_seq    SEQUENCE     �   CREATE SEQUENCE public.yorumlar_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.yorumlar_id_seq;
       public          postgres    false    220            b           0    0    yorumlar_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.yorumlar_id_seq OWNED BY public.yorumlar.id;
          public          postgres    false    219            �           2604    16546    kategoriler id    DEFAULT     p   ALTER TABLE ONLY public.kategoriler ALTER COLUMN id SET DEFAULT nextval('public.kategoriler_id_seq'::regclass);
 =   ALTER TABLE public.kategoriler ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    223    222    223            �           2604    16480    kullanicilar id    DEFAULT     r   ALTER TABLE ONLY public.kullanicilar ALTER COLUMN id SET DEFAULT nextval('public.kullanicilar_id_seq'::regclass);
 >   ALTER TABLE public.kullanicilar ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    216    216            �           2604    16577    tarif_kategori_iliskisi id    DEFAULT     �   ALTER TABLE ONLY public.tarif_kategori_iliskisi ALTER COLUMN id SET DEFAULT nextval('public.tarif_kategori_iliskisi_id_seq'::regclass);
 I   ALTER TABLE public.tarif_kategori_iliskisi ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    224    225    225            �           2604    16494    tarifler id    DEFAULT     j   ALTER TABLE ONLY public.tarifler ALTER COLUMN id SET DEFAULT nextval('public.tarifler_id_seq'::regclass);
 :   ALTER TABLE public.tarifler ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    218    218            �           2604    16509    yorumlar id    DEFAULT     j   ALTER TABLE ONLY public.yorumlar ALTER COLUMN id SET DEFAULT nextval('public.yorumlar_id_seq'::regclass);
 :   ALTER TABLE public.yorumlar ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    219    220    220            S          0    16526 	   favoriler 
   TABLE DATA           K   COPY public.favoriler (kullanici_id, tarif_id, eklenme_tarihi) FROM stdin;
    public          postgres    false    221   �D       U          0    16543    kategoriler 
   TABLE DATA           -   COPY public.kategoriler (id, ad) FROM stdin;
    public          postgres    false    223   �D       N          0    16477    kullanicilar 
   TABLE DATA           d   COPY public.kullanicilar (id, kullanici_adi, eposta, sifre, profil_resmi, kayit_tarihi) FROM stdin;
    public          postgres    false    216   �D       W          0    16574    tarif_kategori_iliskisi 
   TABLE DATA           L   COPY public.tarif_kategori_iliskisi (id, tarif_id, kategori_id) FROM stdin;
    public          postgres    false    225   rE       P          0    16491    tarifler 
   TABLE DATA           �   COPY public.tarifler (id, kullanici_id, baslik, malzemeler, hazirlik_suresi, pisirme_suresi, yapilis_asamalari, resim_url, eklenme_tarihi, aciklama, yapilis_yolu, porsiyon_sure, hazirlanis, olusturma_tarihi, kategori, kategori_id) FROM stdin;
    public          postgres    false    218   �E       R          0    16506    yorumlar 
   TABLE DATA           _   COPY public.yorumlar (id, kullanici_id, tarif_id, yorum_metni, puan, yorum_tarihi) FROM stdin;
    public          postgres    false    220   yN       c           0    0    kategoriler_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.kategoriler_id_seq', 1, false);
          public          postgres    false    222            d           0    0    kullanicilar_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.kullanicilar_id_seq', 1, true);
          public          postgres    false    215            e           0    0    tarif_kategori_iliskisi_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.tarif_kategori_iliskisi_id_seq', 1, false);
          public          postgres    false    224            f           0    0    tarifler_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.tarifler_id_seq', 5, true);
          public          postgres    false    217            g           0    0    yorumlar_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.yorumlar_id_seq', 1, false);
          public          postgres    false    219            �           2606    16531    favoriler favoriler_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.favoriler
    ADD CONSTRAINT favoriler_pkey PRIMARY KEY (kullanici_id, tarif_id);
 B   ALTER TABLE ONLY public.favoriler DROP CONSTRAINT favoriler_pkey;
       public            postgres    false    221    221            �           2606    16550    kategoriler kategoriler_ad_key 
   CONSTRAINT     W   ALTER TABLE ONLY public.kategoriler
    ADD CONSTRAINT kategoriler_ad_key UNIQUE (ad);
 H   ALTER TABLE ONLY public.kategoriler DROP CONSTRAINT kategoriler_ad_key;
       public            postgres    false    223            �           2606    16548    kategoriler kategoriler_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.kategoriler
    ADD CONSTRAINT kategoriler_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.kategoriler DROP CONSTRAINT kategoriler_pkey;
       public            postgres    false    223            �           2606    16489 $   kullanicilar kullanicilar_eposta_key 
   CONSTRAINT     a   ALTER TABLE ONLY public.kullanicilar
    ADD CONSTRAINT kullanicilar_eposta_key UNIQUE (eposta);
 N   ALTER TABLE ONLY public.kullanicilar DROP CONSTRAINT kullanicilar_eposta_key;
       public            postgres    false    216            �           2606    16487 +   kullanicilar kullanicilar_kullanici_adi_key 
   CONSTRAINT     o   ALTER TABLE ONLY public.kullanicilar
    ADD CONSTRAINT kullanicilar_kullanici_adi_key UNIQUE (kullanici_adi);
 U   ALTER TABLE ONLY public.kullanicilar DROP CONSTRAINT kullanicilar_kullanici_adi_key;
       public            postgres    false    216            �           2606    16485    kullanicilar kullanicilar_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.kullanicilar
    ADD CONSTRAINT kullanicilar_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.kullanicilar DROP CONSTRAINT kullanicilar_pkey;
       public            postgres    false    216            �           2606    16579 4   tarif_kategori_iliskisi tarif_kategori_iliskisi_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY public.tarif_kategori_iliskisi
    ADD CONSTRAINT tarif_kategori_iliskisi_pkey PRIMARY KEY (id);
 ^   ALTER TABLE ONLY public.tarif_kategori_iliskisi DROP CONSTRAINT tarif_kategori_iliskisi_pkey;
       public            postgres    false    225            �           2606    16581 H   tarif_kategori_iliskisi tarif_kategori_iliskisi_tarif_id_kategori_id_key 
   CONSTRAINT     �   ALTER TABLE ONLY public.tarif_kategori_iliskisi
    ADD CONSTRAINT tarif_kategori_iliskisi_tarif_id_kategori_id_key UNIQUE (tarif_id, kategori_id);
 r   ALTER TABLE ONLY public.tarif_kategori_iliskisi DROP CONSTRAINT tarif_kategori_iliskisi_tarif_id_kategori_id_key;
       public            postgres    false    225    225            �           2606    16499    tarifler tarifler_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.tarifler
    ADD CONSTRAINT tarifler_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.tarifler DROP CONSTRAINT tarifler_pkey;
       public            postgres    false    218            �           2606    16515    yorumlar yorumlar_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.yorumlar
    ADD CONSTRAINT yorumlar_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.yorumlar DROP CONSTRAINT yorumlar_pkey;
       public            postgres    false    220            �           2606    16532 %   favoriler favoriler_kullanici_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.favoriler
    ADD CONSTRAINT favoriler_kullanici_id_fkey FOREIGN KEY (kullanici_id) REFERENCES public.kullanicilar(id) ON DELETE CASCADE;
 O   ALTER TABLE ONLY public.favoriler DROP CONSTRAINT favoriler_kullanici_id_fkey;
       public          postgres    false    221    216    4775            �           2606    16537 !   favoriler favoriler_tarif_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.favoriler
    ADD CONSTRAINT favoriler_tarif_id_fkey FOREIGN KEY (tarif_id) REFERENCES public.tarifler(id) ON DELETE CASCADE;
 K   ALTER TABLE ONLY public.favoriler DROP CONSTRAINT favoriler_tarif_id_fkey;
       public          postgres    false    221    218    4777            �           2606    16568    tarifler fk_tarif_kategori    FK CONSTRAINT     �   ALTER TABLE ONLY public.tarifler
    ADD CONSTRAINT fk_tarif_kategori FOREIGN KEY (kategori_id) REFERENCES public.kategoriler(id);
 D   ALTER TABLE ONLY public.tarifler DROP CONSTRAINT fk_tarif_kategori;
       public          postgres    false    218    223    4785            �           2606    16587 @   tarif_kategori_iliskisi tarif_kategori_iliskisi_kategori_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.tarif_kategori_iliskisi
    ADD CONSTRAINT tarif_kategori_iliskisi_kategori_id_fkey FOREIGN KEY (kategori_id) REFERENCES public.kategoriler(id) ON DELETE CASCADE;
 j   ALTER TABLE ONLY public.tarif_kategori_iliskisi DROP CONSTRAINT tarif_kategori_iliskisi_kategori_id_fkey;
       public          postgres    false    4785    225    223            �           2606    16582 =   tarif_kategori_iliskisi tarif_kategori_iliskisi_tarif_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.tarif_kategori_iliskisi
    ADD CONSTRAINT tarif_kategori_iliskisi_tarif_id_fkey FOREIGN KEY (tarif_id) REFERENCES public.tarifler(id) ON DELETE CASCADE;
 g   ALTER TABLE ONLY public.tarif_kategori_iliskisi DROP CONSTRAINT tarif_kategori_iliskisi_tarif_id_fkey;
       public          postgres    false    225    218    4777            �           2606    16500 #   tarifler tarifler_kullanici_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.tarifler
    ADD CONSTRAINT tarifler_kullanici_id_fkey FOREIGN KEY (kullanici_id) REFERENCES public.kullanicilar(id) ON DELETE CASCADE;
 M   ALTER TABLE ONLY public.tarifler DROP CONSTRAINT tarifler_kullanici_id_fkey;
       public          postgres    false    4775    216    218            �           2606    16516 #   yorumlar yorumlar_kullanici_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.yorumlar
    ADD CONSTRAINT yorumlar_kullanici_id_fkey FOREIGN KEY (kullanici_id) REFERENCES public.kullanicilar(id) ON DELETE CASCADE;
 M   ALTER TABLE ONLY public.yorumlar DROP CONSTRAINT yorumlar_kullanici_id_fkey;
       public          postgres    false    216    220    4775            �           2606    16521    yorumlar yorumlar_tarif_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.yorumlar
    ADD CONSTRAINT yorumlar_tarif_id_fkey FOREIGN KEY (tarif_id) REFERENCES public.tarifler(id) ON DELETE CASCADE;
 I   ALTER TABLE ONLY public.yorumlar DROP CONSTRAINT yorumlar_tarif_id_fkey;
       public          postgres    false    218    4777    220            S      x������ � �      U      x������ � �      N   �   x�3��I�I�K-J�,Fb�:��&f��%��r�U����V�8�T:�V�y�fx���E�8�E�U�F��G�����8g�XF��r��q�����)�XXZ��Y�ZZ�Zr��qqq RM'X      W      x������ � �      P   �  x��X�n�H]�_Q�@",ʲ�*��A��Hz ��X�k�H
| `~b0^z��x����so_��]��ź�sϹU��r���NZ�6z�Ef��X���,����S�Dlt&k������A�};&KQ�Xa�+�b����R�P���x�Z)V�K˄�\��#s"o^
�y!��*S/s+�ҨB��D�JΖ��|�\�.�X�B7�:��ɖ^V��!i���s�"&�ݔ��HV�n�����.����ӱ�xG���!�̤��%k^j�Xsx��1�`׭�9##��;+�G�����@[���8-����,b��	�SZ+�`��g=q��i+R$��D���*S�,��p!>��j�n�$��$�f��,��C��}�&�Jˉ؋��v�-�A!`xh5��X�^����)�9��b��[VP~u^�*��xJ"T"��D��/IMA��k�s=i��dc�`���Qgƃ�� ���^K&�T,Fk= ɟBn`/�@L"��=Yu��'���J�|�`)B8S�HO�6ֹ�n�P��������ù���a�9�SxqLP8�Q�Ȟ@1�:Q�U�Pc�[���Z�/��ƕ�W�j��~%]B�*�b���Fe�:���������"���Ǒ�P�4�KLAM�L~#��e���ٹB���5��d^`/�l���]�ڒ#�a�p��I�es@,!��Tcc���rrĘ]r���õ >��R���Sz�@> �6��1�2r�Qۜ�����Ԫ�� A���|�hF0J��T5O��4ͣׁ�ER���t�?�߬�\F���3��:Gd9�1�2�eEuAR�iz��S�_CR�X/"Zb�Md�r!��x\}���n����W���<�D^d�y;mc�s#��`�۔u�Z�ፌ���E�
[�\�b����h�2'ywu$�.h{Nלk���A�� B�B�'�w	׋�Ex%���py^�w�����?�?����c�G	M0j
�U��V�SEN%��ıԺ��m	R������D?z�q��&���O !v��i�����L<\��i|��QQ��n�>�H��M�r@�y;�~NU�ְ�Mdf.&�2�Y�`����I����y�E,m�8�� ����P�x�=l�r�1�� �	�Lp
K�����`0�E�N�4M���yPj"E�)(5�-��T(c�������D�P��T�XF���r��|t|<ޥm8�8��D���sF�躌��GV!�IG�#����H���q8��`�8�H�^M�v���[r(|���Pb��nj��Y��bh�U
�I�vɋ��|Ƙ �' xN�߭@t{��P��%����4TW,^�W5�&��6%;�4����㫥�:Q�q��'��6��LJ�mƼs�i���
a���gB�^�N�	\��z_�/�n�pD7x�X���ybr��?v�a�i�[�6i�@O�=2\�-���4��]�#:�����������/���y��8P9�t`����5��^uCς|���|�������3�n�:;���fgiQ:w���P3WҐ֙�����b���ϩj"*��'ސ��X�O�b���P������c�JB�^�u�cW�I_?#mtۉm�@��D{ť�&:]��G�:��\W���e���0��v.h���с .�D	#��朔x�~�d:/��_C�/���ux~G�O���!��ʝU�B�����\��5�L\Xxa_�+����ù;ǑFa˚d�z�Yfz�@�X�p�m�2��&��e����c�f�3�����<&s�;^z׹܅ j�&Lڥ�k��q�zy�l��X��]E�����鞌���rҶ��E[A��KA��cY�F����@gT��{x�:���l�c�@�M�q2ݿG7
�cѨ�c��idp@�R�)%��JQP�аХ��Z��>�?b�:���dx�9��9�����m��ű >8�v��'H"3�W5�c@IDv��<|��k�"�y��|F�pTAqTf��3?�vQNZ�M�mc����ݗ]�~�6rx���'3N/���?�9�CP����	�$���D���7�#$%ɓ�C�#W�޺O�?<A��#e:�1*[�#��O_�ot���-OT���o���y�����7�uj�Y��s��"E})�����&\��e�n5�PQ�6�I{˛����><�݄��o7�o7�o7�o7�o7�o7�o7���H�C'�~���������      R      x������ � �     