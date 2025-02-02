PGDMP                  
    |           ign-tattoo-test    17.0    17.0 }    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            �           1262    16388    ign-tattoo-test    DATABASE     �   CREATE DATABASE "ign-tattoo-test" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Spain.1252';
 !   DROP DATABASE "ign-tattoo-test";
                     postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
                     pg_database_owner    false            �           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                        pg_database_owner    false    4            �            1259    16638    appointments    TABLE     0  CREATE TABLE public.appointments (
    id integer NOT NULL,
    user_id integer,
    tattoo_artist_id integer,
    date date NOT NULL,
    "time" time without time zone NOT NULL,
    description text,
    status character varying(20) DEFAULT 'pending'::character varying,
    reference_image_url text
);
     DROP TABLE public.appointments;
       public         heap r       postgres    false    4            �            1259    16637    appointments_id_seq    SEQUENCE     �   CREATE SEQUENCE public.appointments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.appointments_id_seq;
       public               postgres    false    4    228            �           0    0    appointments_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.appointments_id_seq OWNED BY public.appointments.id;
          public               postgres    false    227            �            1259    16481    comments    TABLE     �   CREATE TABLE public.comments (
    id integer NOT NULL,
    post_id integer NOT NULL,
    user_id integer NOT NULL,
    content text NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.comments;
       public         heap r       postgres    false    4            �            1259    16480    comments_id_seq    SEQUENCE     �   CREATE SEQUENCE public.comments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.comments_id_seq;
       public               postgres    false    4    223            �           0    0    comments_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.comments_id_seq OWNED BY public.comments.id;
          public               postgres    false    222            �            1259    16680    designer_projects    TABLE     �  CREATE TABLE public.designer_projects (
    id integer NOT NULL,
    designer_id integer,
    title character varying(255) NOT NULL,
    description text,
    image character varying(255),
    price numeric(10,2),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    currency character varying(10) DEFAULT 'CLP'::character varying,
    is_available boolean DEFAULT true,
    is_requested boolean
);
 %   DROP TABLE public.designer_projects;
       public         heap r       postgres    false    4            �            1259    16679    designer_projects_id_seq    SEQUENCE     �   CREATE SEQUENCE public.designer_projects_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.designer_projects_id_seq;
       public               postgres    false    4    232            �           0    0    designer_projects_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.designer_projects_id_seq OWNED BY public.designer_projects.id;
          public               postgres    false    231            �            1259    16514    follows    TABLE     �   CREATE TABLE public.follows (
    follower_id integer NOT NULL,
    following_id integer NOT NULL,
    followed_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.follows;
       public         heap r       postgres    false    4            �            1259    16464    likes    TABLE     �   CREATE TABLE public.likes (
    post_id integer NOT NULL,
    user_id integer NOT NULL,
    liked_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.likes;
       public         heap r       postgres    false    4            �            1259    16659    messages    TABLE       CREATE TABLE public.messages (
    id integer NOT NULL,
    sender_id integer,
    receiver_id integer,
    content text NOT NULL,
    image_url character varying(255),
    sent_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    is_read boolean DEFAULT false
);
    DROP TABLE public.messages;
       public         heap r       postgres    false    4            �            1259    16658    messages_id_seq    SEQUENCE     �   CREATE SEQUENCE public.messages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.messages_id_seq;
       public               postgres    false    4    230            �           0    0    messages_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.messages_id_seq OWNED BY public.messages.id;
          public               postgres    false    229            �            1259    16450    posts    TABLE     �   CREATE TABLE public.posts (
    id integer NOT NULL,
    user_id integer NOT NULL,
    content text NOT NULL,
    image character varying(255),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.posts;
       public         heap r       postgres    false    4            �            1259    16449    posts_id_seq    SEQUENCE     �   CREATE SEQUENCE public.posts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.posts_id_seq;
       public               postgres    false    220    4            �           0    0    posts_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.posts_id_seq OWNED BY public.posts.id;
          public               postgres    false    219            �            1259    25025    postulaciones    TABLE     �  CREATE TABLE public.postulaciones (
    id integer NOT NULL,
    username character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    role character varying(50) NOT NULL,
    password character varying(255) NOT NULL,
    requisitos character varying(255),
    aprobado boolean DEFAULT false,
    name character varying(255),
    profile_pic character varying(255)
);
 !   DROP TABLE public.postulaciones;
       public         heap r       postgres    false    4            �            1259    25024    postulaciones_id_seq    SEQUENCE     �   CREATE SEQUENCE public.postulaciones_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.postulaciones_id_seq;
       public               postgres    false    4    244            �           0    0    postulaciones_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.postulaciones_id_seq OWNED BY public.postulaciones.id;
          public               postgres    false    243            �            1259    16724    requested_design    TABLE     o  CREATE TABLE public.requested_design (
    id integer NOT NULL,
    user_id integer NOT NULL,
    designer_id integer NOT NULL,
    project_id integer NOT NULL,
    price numeric(10,2) NOT NULL,
    status character varying(15) DEFAULT 'pending'::character varying,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    image character varying
);
 $   DROP TABLE public.requested_design;
       public         heap r       postgres    false    4            �            1259    16723    requested_design_id_seq    SEQUENCE     �   CREATE SEQUENCE public.requested_design_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.requested_design_id_seq;
       public               postgres    false    234    4            �           0    0    requested_design_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.requested_design_id_seq OWNED BY public.requested_design.id;
          public               postgres    false    233            �            1259    24996    reviews    TABLE     �  CREATE TABLE public.reviews (
    id integer NOT NULL,
    appointment_id integer NOT NULL,
    tattoo_artist_id integer NOT NULL,
    client_username character varying(100) NOT NULL,
    review_text text,
    rating integer,
    is_published boolean DEFAULT false,
    tattoo_image_url text,
    created_at timestamp without time zone DEFAULT now(),
    CONSTRAINT reviews_rating_check CHECK (((rating >= 1) AND (rating <= 10)))
);
    DROP TABLE public.reviews;
       public         heap r       postgres    false    4            �            1259    24995    reviews_id_seq    SEQUENCE     �   CREATE SEQUENCE public.reviews_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.reviews_id_seq;
       public               postgres    false    4    242            �           0    0    reviews_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.reviews_id_seq OWNED BY public.reviews.id;
          public               postgres    false    241            �            1259    24928    studio_invitations    TABLE     g  CREATE TABLE public.studio_invitations (
    id integer NOT NULL,
    studio_id integer NOT NULL,
    slot_id integer NOT NULL,
    tattoo_artist_id integer NOT NULL,
    status character varying(20) DEFAULT 'Pending'::character varying NOT NULL,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now()
);
 &   DROP TABLE public.studio_invitations;
       public         heap r       postgres    false    4            �            1259    24927    studio_invitations_id_seq    SEQUENCE     �   CREATE SEQUENCE public.studio_invitations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.studio_invitations_id_seq;
       public               postgres    false    240    4            �           0    0    studio_invitations_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.studio_invitations_id_seq OWNED BY public.studio_invitations.id;
          public               postgres    false    239            �            1259    16752    studio_slots    TABLE       CREATE TABLE public.studio_slots (
    id integer NOT NULL,
    studio_id integer NOT NULL,
    slot_number integer NOT NULL,
    assigned_tattoo_artist_id integer,
    is_available boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
     DROP TABLE public.studio_slots;
       public         heap r       postgres    false    4            �            1259    16751    studio_slots_id_seq    SEQUENCE     �   CREATE SEQUENCE public.studio_slots_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.studio_slots_id_seq;
       public               postgres    false    238    4            �           0    0    studio_slots_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.studio_slots_id_seq OWNED BY public.studio_slots.id;
          public               postgres    false    237            �            1259    16623    tattoo_artist_availability    TABLE     �   CREATE TABLE public.tattoo_artist_availability (
    id integer NOT NULL,
    tattoo_artist_id integer,
    date date NOT NULL,
    start_time time without time zone NOT NULL,
    is_available boolean DEFAULT true,
    description text
);
 .   DROP TABLE public.tattoo_artist_availability;
       public         heap r       postgres    false    4            �            1259    16622 !   tattoo_artist_availability_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tattoo_artist_availability_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.tattoo_artist_availability_id_seq;
       public               postgres    false    4    226            �           0    0 !   tattoo_artist_availability_id_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.tattoo_artist_availability_id_seq OWNED BY public.tattoo_artist_availability.id;
          public               postgres    false    225            �            1259    16736    tattoo_studios    TABLE     l  CREATE TABLE public.tattoo_studios (
    id integer NOT NULL,
    owner_id integer NOT NULL,
    name character varying(100) NOT NULL,
    address text NOT NULL,
    description text,
    image_url character varying(255),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    status character varying(20) DEFAULT 'active'::character varying
);
 "   DROP TABLE public.tattoo_studios;
       public         heap r       postgres    false    4            �            1259    16735    tattoo_studios_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tattoo_studios_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.tattoo_studios_id_seq;
       public               postgres    false    236    4            �           0    0    tattoo_studios_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.tattoo_studios_id_seq OWNED BY public.tattoo_studios.id;
          public               postgres    false    235            �            1259    16401    users    TABLE     G  CREATE TABLE public.users (
    id integer NOT NULL,
    username character varying(50) NOT NULL,
    email character varying(100) NOT NULL,
    password character varying(255) NOT NULL,
    bio text,
    profile_pic character varying(255),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    role character varying(50) DEFAULT 'user'::character varying,
    name character varying(90),
    is_verified boolean DEFAULT false,
    verification_token text,
    reset_password_token character varying(64),
    reset_password_expires timestamp without time zone
);
    DROP TABLE public.users;
       public         heap r       postgres    false    4            �            1259    16400    users_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public               postgres    false    4    218            �           0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public               postgres    false    217            �           2604    16641    appointments id    DEFAULT     r   ALTER TABLE ONLY public.appointments ALTER COLUMN id SET DEFAULT nextval('public.appointments_id_seq'::regclass);
 >   ALTER TABLE public.appointments ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    228    227    228            �           2604    16484    comments id    DEFAULT     j   ALTER TABLE ONLY public.comments ALTER COLUMN id SET DEFAULT nextval('public.comments_id_seq'::regclass);
 :   ALTER TABLE public.comments ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    223    222    223            �           2604    16683    designer_projects id    DEFAULT     |   ALTER TABLE ONLY public.designer_projects ALTER COLUMN id SET DEFAULT nextval('public.designer_projects_id_seq'::regclass);
 C   ALTER TABLE public.designer_projects ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    231    232    232            �           2604    16662    messages id    DEFAULT     j   ALTER TABLE ONLY public.messages ALTER COLUMN id SET DEFAULT nextval('public.messages_id_seq'::regclass);
 :   ALTER TABLE public.messages ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    229    230    230            �           2604    16453    posts id    DEFAULT     d   ALTER TABLE ONLY public.posts ALTER COLUMN id SET DEFAULT nextval('public.posts_id_seq'::regclass);
 7   ALTER TABLE public.posts ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    219    220    220            �           2604    25028    postulaciones id    DEFAULT     t   ALTER TABLE ONLY public.postulaciones ALTER COLUMN id SET DEFAULT nextval('public.postulaciones_id_seq'::regclass);
 ?   ALTER TABLE public.postulaciones ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    244    243    244            �           2604    16727    requested_design id    DEFAULT     z   ALTER TABLE ONLY public.requested_design ALTER COLUMN id SET DEFAULT nextval('public.requested_design_id_seq'::regclass);
 B   ALTER TABLE public.requested_design ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    233    234    234            �           2604    24999 
   reviews id    DEFAULT     h   ALTER TABLE ONLY public.reviews ALTER COLUMN id SET DEFAULT nextval('public.reviews_id_seq'::regclass);
 9   ALTER TABLE public.reviews ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    241    242    242            �           2604    24931    studio_invitations id    DEFAULT     ~   ALTER TABLE ONLY public.studio_invitations ALTER COLUMN id SET DEFAULT nextval('public.studio_invitations_id_seq'::regclass);
 D   ALTER TABLE public.studio_invitations ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    239    240    240            �           2604    16755    studio_slots id    DEFAULT     r   ALTER TABLE ONLY public.studio_slots ALTER COLUMN id SET DEFAULT nextval('public.studio_slots_id_seq'::regclass);
 >   ALTER TABLE public.studio_slots ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    237    238    238            �           2604    16626    tattoo_artist_availability id    DEFAULT     �   ALTER TABLE ONLY public.tattoo_artist_availability ALTER COLUMN id SET DEFAULT nextval('public.tattoo_artist_availability_id_seq'::regclass);
 L   ALTER TABLE public.tattoo_artist_availability ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    225    226    226            �           2604    16739    tattoo_studios id    DEFAULT     v   ALTER TABLE ONLY public.tattoo_studios ALTER COLUMN id SET DEFAULT nextval('public.tattoo_studios_id_seq'::regclass);
 @   ALTER TABLE public.tattoo_studios ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    236    235    236            �           2604    16404    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    217    218    218            �          0    16638    appointments 
   TABLE DATA                 public               postgres    false    228   ��       �          0    16481    comments 
   TABLE DATA                 public               postgres    false    223   �       �          0    16680    designer_projects 
   TABLE DATA                 public               postgres    false    232   ��       �          0    16514    follows 
   TABLE DATA                 public               postgres    false    224   .�       �          0    16464    likes 
   TABLE DATA                 public               postgres    false    221   K�       �          0    16659    messages 
   TABLE DATA                 public               postgres    false    230   ]�       �          0    16450    posts 
   TABLE DATA                 public               postgres    false    220   @�       �          0    25025    postulaciones 
   TABLE DATA                 public               postgres    false    244   y�       �          0    16724    requested_design 
   TABLE DATA                 public               postgres    false    234   A�       �          0    24996    reviews 
   TABLE DATA                 public               postgres    false    242   M�       �          0    24928    studio_invitations 
   TABLE DATA                 public               postgres    false    240   ��       �          0    16752    studio_slots 
   TABLE DATA                 public               postgres    false    238   s�       �          0    16623    tattoo_artist_availability 
   TABLE DATA                 public               postgres    false    226   >�       �          0    16736    tattoo_studios 
   TABLE DATA                 public               postgres    false    236   ��       �          0    16401    users 
   TABLE DATA                 public               postgres    false    218   ��       �           0    0    appointments_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.appointments_id_seq', 28, true);
          public               postgres    false    227            �           0    0    comments_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.comments_id_seq', 23, true);
          public               postgres    false    222            �           0    0    designer_projects_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.designer_projects_id_seq', 7, true);
          public               postgres    false    231            �           0    0    messages_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.messages_id_seq', 178, true);
          public               postgres    false    229            �           0    0    posts_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.posts_id_seq', 42, true);
          public               postgres    false    219            �           0    0    postulaciones_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.postulaciones_id_seq', 14, true);
          public               postgres    false    243            �           0    0    requested_design_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.requested_design_id_seq', 13, true);
          public               postgres    false    233            �           0    0    reviews_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.reviews_id_seq', 6, true);
          public               postgres    false    241            �           0    0    studio_invitations_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.studio_invitations_id_seq', 11, true);
          public               postgres    false    239            �           0    0    studio_slots_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.studio_slots_id_seq', 45, true);
          public               postgres    false    237            �           0    0 !   tattoo_artist_availability_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.tattoo_artist_availability_id_seq', 12, true);
          public               postgres    false    225            �           0    0    tattoo_studios_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.tattoo_studios_id_seq', 10, true);
          public               postgres    false    235            �           0    0    users_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.users_id_seq', 65, true);
          public               postgres    false    217            �           2606    16646    appointments appointments_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.appointments
    ADD CONSTRAINT appointments_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.appointments DROP CONSTRAINT appointments_pkey;
       public                 postgres    false    228            �           2606    16489    comments comments_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.comments DROP CONSTRAINT comments_pkey;
       public                 postgres    false    223            �           2606    16688 (   designer_projects designer_projects_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.designer_projects
    ADD CONSTRAINT designer_projects_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.designer_projects DROP CONSTRAINT designer_projects_pkey;
       public                 postgres    false    232            �           2606    16519    follows follows_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.follows
    ADD CONSTRAINT follows_pkey PRIMARY KEY (follower_id, following_id);
 >   ALTER TABLE ONLY public.follows DROP CONSTRAINT follows_pkey;
       public                 postgres    false    224    224            �           2606    16469    likes likes_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.likes
    ADD CONSTRAINT likes_pkey PRIMARY KEY (post_id, user_id);
 :   ALTER TABLE ONLY public.likes DROP CONSTRAINT likes_pkey;
       public                 postgres    false    221    221            �           2606    16668    messages messages_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.messages
    ADD CONSTRAINT messages_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.messages DROP CONSTRAINT messages_pkey;
       public                 postgres    false    230            �           2606    16458    posts posts_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.posts DROP CONSTRAINT posts_pkey;
       public                 postgres    false    220            �           2606    25033     postulaciones postulaciones_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.postulaciones
    ADD CONSTRAINT postulaciones_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.postulaciones DROP CONSTRAINT postulaciones_pkey;
       public                 postgres    false    244            �           2606    16731 &   requested_design requested_design_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.requested_design
    ADD CONSTRAINT requested_design_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.requested_design DROP CONSTRAINT requested_design_pkey;
       public                 postgres    false    234            �           2606    25006    reviews reviews_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.reviews DROP CONSTRAINT reviews_pkey;
       public                 postgres    false    242            �           2606    24936 *   studio_invitations studio_invitations_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.studio_invitations
    ADD CONSTRAINT studio_invitations_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.studio_invitations DROP CONSTRAINT studio_invitations_pkey;
       public                 postgres    false    240            �           2606    16759    studio_slots studio_slots_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.studio_slots
    ADD CONSTRAINT studio_slots_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.studio_slots DROP CONSTRAINT studio_slots_pkey;
       public                 postgres    false    238            �           2606    16631 :   tattoo_artist_availability tattoo_artist_availability_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.tattoo_artist_availability
    ADD CONSTRAINT tattoo_artist_availability_pkey PRIMARY KEY (id);
 d   ALTER TABLE ONLY public.tattoo_artist_availability DROP CONSTRAINT tattoo_artist_availability_pkey;
       public                 postgres    false    226            �           2606    16745 "   tattoo_studios tattoo_studios_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.tattoo_studios
    ADD CONSTRAINT tattoo_studios_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.tattoo_studios DROP CONSTRAINT tattoo_studios_pkey;
       public                 postgres    false    236            �           2606    16411    users users_email_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);
 ?   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key;
       public                 postgres    false    218            �           2606    16409    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public                 postgres    false    218            �           2606    16652 /   appointments appointments_tattoo_artist_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.appointments
    ADD CONSTRAINT appointments_tattoo_artist_id_fkey FOREIGN KEY (tattoo_artist_id) REFERENCES public.users(id);
 Y   ALTER TABLE ONLY public.appointments DROP CONSTRAINT appointments_tattoo_artist_id_fkey;
       public               postgres    false    218    228    4806            �           2606    16647 &   appointments appointments_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.appointments
    ADD CONSTRAINT appointments_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);
 P   ALTER TABLE ONLY public.appointments DROP CONSTRAINT appointments_user_id_fkey;
       public               postgres    false    228    4806    218            �           2606    16490    comments comments_post_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_post_id_fkey FOREIGN KEY (post_id) REFERENCES public.posts(id) ON DELETE CASCADE;
 H   ALTER TABLE ONLY public.comments DROP CONSTRAINT comments_post_id_fkey;
       public               postgres    false    223    220    4808            �           2606    16495    comments comments_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;
 H   ALTER TABLE ONLY public.comments DROP CONSTRAINT comments_user_id_fkey;
       public               postgres    false    223    4806    218            �           2606    16689 4   designer_projects designer_projects_designer_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.designer_projects
    ADD CONSTRAINT designer_projects_designer_id_fkey FOREIGN KEY (designer_id) REFERENCES public.users(id) ON DELETE CASCADE;
 ^   ALTER TABLE ONLY public.designer_projects DROP CONSTRAINT designer_projects_designer_id_fkey;
       public               postgres    false    4806    232    218            �           2606    16520     follows follows_follower_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.follows
    ADD CONSTRAINT follows_follower_id_fkey FOREIGN KEY (follower_id) REFERENCES public.users(id) ON DELETE CASCADE;
 J   ALTER TABLE ONLY public.follows DROP CONSTRAINT follows_follower_id_fkey;
       public               postgres    false    224    218    4806            �           2606    16525 !   follows follows_following_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.follows
    ADD CONSTRAINT follows_following_id_fkey FOREIGN KEY (following_id) REFERENCES public.users(id) ON DELETE CASCADE;
 K   ALTER TABLE ONLY public.follows DROP CONSTRAINT follows_following_id_fkey;
       public               postgres    false    4806    224    218            �           2606    16470    likes likes_post_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.likes
    ADD CONSTRAINT likes_post_id_fkey FOREIGN KEY (post_id) REFERENCES public.posts(id) ON DELETE CASCADE;
 B   ALTER TABLE ONLY public.likes DROP CONSTRAINT likes_post_id_fkey;
       public               postgres    false    4808    220    221            �           2606    16475    likes likes_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.likes
    ADD CONSTRAINT likes_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;
 B   ALTER TABLE ONLY public.likes DROP CONSTRAINT likes_user_id_fkey;
       public               postgres    false    221    218    4806            �           2606    16674 "   messages messages_receiver_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.messages
    ADD CONSTRAINT messages_receiver_id_fkey FOREIGN KEY (receiver_id) REFERENCES public.users(id) ON DELETE CASCADE;
 L   ALTER TABLE ONLY public.messages DROP CONSTRAINT messages_receiver_id_fkey;
       public               postgres    false    4806    230    218            �           2606    16669     messages messages_sender_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.messages
    ADD CONSTRAINT messages_sender_id_fkey FOREIGN KEY (sender_id) REFERENCES public.users(id) ON DELETE CASCADE;
 J   ALTER TABLE ONLY public.messages DROP CONSTRAINT messages_sender_id_fkey;
       public               postgres    false    4806    218    230            �           2606    16459    posts posts_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;
 B   ALTER TABLE ONLY public.posts DROP CONSTRAINT posts_user_id_fkey;
       public               postgres    false    220    218    4806            �           2606    25007 #   reviews reviews_appointment_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_appointment_id_fkey FOREIGN KEY (appointment_id) REFERENCES public.appointments(id) ON DELETE CASCADE;
 M   ALTER TABLE ONLY public.reviews DROP CONSTRAINT reviews_appointment_id_fkey;
       public               postgres    false    228    4818    242            �           2606    25012 %   reviews reviews_tattoo_artist_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_tattoo_artist_id_fkey FOREIGN KEY (tattoo_artist_id) REFERENCES public.users(id) ON DELETE CASCADE;
 O   ALTER TABLE ONLY public.reviews DROP CONSTRAINT reviews_tattoo_artist_id_fkey;
       public               postgres    false    4806    242    218            �           2606    24942 2   studio_invitations studio_invitations_slot_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.studio_invitations
    ADD CONSTRAINT studio_invitations_slot_id_fkey FOREIGN KEY (slot_id) REFERENCES public.studio_slots(id) ON DELETE SET NULL;
 \   ALTER TABLE ONLY public.studio_invitations DROP CONSTRAINT studio_invitations_slot_id_fkey;
       public               postgres    false    4828    240    238            �           2606    24937 4   studio_invitations studio_invitations_studio_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.studio_invitations
    ADD CONSTRAINT studio_invitations_studio_id_fkey FOREIGN KEY (studio_id) REFERENCES public.tattoo_studios(id) ON DELETE CASCADE;
 ^   ALTER TABLE ONLY public.studio_invitations DROP CONSTRAINT studio_invitations_studio_id_fkey;
       public               postgres    false    236    4826    240            �           2606    24947 ;   studio_invitations studio_invitations_tattoo_artist_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.studio_invitations
    ADD CONSTRAINT studio_invitations_tattoo_artist_id_fkey FOREIGN KEY (tattoo_artist_id) REFERENCES public.users(id) ON DELETE CASCADE;
 e   ALTER TABLE ONLY public.studio_invitations DROP CONSTRAINT studio_invitations_tattoo_artist_id_fkey;
       public               postgres    false    218    240    4806            �           2606    16765 8   studio_slots studio_slots_assigned_tattoo_artist_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.studio_slots
    ADD CONSTRAINT studio_slots_assigned_tattoo_artist_id_fkey FOREIGN KEY (assigned_tattoo_artist_id) REFERENCES public.users(id);
 b   ALTER TABLE ONLY public.studio_slots DROP CONSTRAINT studio_slots_assigned_tattoo_artist_id_fkey;
       public               postgres    false    218    238    4806            �           2606    16760 (   studio_slots studio_slots_studio_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.studio_slots
    ADD CONSTRAINT studio_slots_studio_id_fkey FOREIGN KEY (studio_id) REFERENCES public.tattoo_studios(id);
 R   ALTER TABLE ONLY public.studio_slots DROP CONSTRAINT studio_slots_studio_id_fkey;
       public               postgres    false    4826    238    236            �           2606    16632 K   tattoo_artist_availability tattoo_artist_availability_tattoo_artist_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.tattoo_artist_availability
    ADD CONSTRAINT tattoo_artist_availability_tattoo_artist_id_fkey FOREIGN KEY (tattoo_artist_id) REFERENCES public.users(id);
 u   ALTER TABLE ONLY public.tattoo_artist_availability DROP CONSTRAINT tattoo_artist_availability_tattoo_artist_id_fkey;
       public               postgres    false    4806    218    226            �           2606    16746 +   tattoo_studios tattoo_studios_owner_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.tattoo_studios
    ADD CONSTRAINT tattoo_studios_owner_id_fkey FOREIGN KEY (owner_id) REFERENCES public.users(id);
 U   ALTER TABLE ONLY public.tattoo_studios DROP CONSTRAINT tattoo_studios_owner_id_fkey;
       public               postgres    false    218    4806    236            �   a  x�Ք]k�0����ZMR��+^8ı�cw%k��I֤�I�/T���\�'��<<�,V���-V�{����c����A����P���]0�)sV�M�S2�~���@5W�K�!mO7�C5�Q@ΏlySW#�4[n�k4=D�PL�>�>�lEh��].o�E� �zT�n�VUJWLUIV���S>���q���A����⏑Ip�L�������ká����Kq�}��t<�2��t�ƊT���.���>9�E�V����<��P��W�hLbB�0�W���xҠ�fa�>��x6�!ۊ�p>�W⏤x���ch=�sQ�(���h.��4MH}���� �
��      �   �  x���QK�0��}�{��w�]�Ƨ�
����O�[#N�v���oo:�T|2Ї�	܏�?�F��~�h2��v�\�ռ^�|�l�lQ�`]o�i[l7�}W��	�x�E��iќ����a����HH��;�'�{x���(����F�DH@�i��(� ��痝�-�`8XLh�E��,�~�H��$�&�˫�'�H������>����X@�30��TY�	G�^��tK@t�Tb5� ��n�3_տ ���٦Q���c�b���S�	Sr�N�Bbcm�_���cqȪO֚(���0��r�����4R�Z�(}@4Ms�!��m&%�(ע}�L?���/k(=����f	�d�H�IID�X��:o���D`A�Ɓ�Ē6;A��	�,�       �   u  x�Փ�N�0��{����b�m�rB��$��)k�(mI�I{{ܭ ������GNl}�'�����L��Y�.
���vU7�]�f�Ƴ��G����m
��e�֍���zE��ٌD�nL>��s��6��z�m��s���l���s�ru�|3cC1b@�lښuŠ[gd>h�YS��q[���x��� !�����^QrZ��� �0�
�� �?_�>�h\kv���`rzX��rgَձ�:�-�^��l���<˭7�QXd,Q���%aq�@��B�H����
{X��ˮj�I��f�q�P(7�3Ĕ�T� A%�d��R�DaD=�ھ����<�C�T<�
�jH�a�%�Xk_[X      �     x���;k�0�ݟ�$��{�٩CCI�I���I��4���+�%u2ʠA7����Ԭ7��-4��=|�<w�y=u��������k5E��vV����n�W���@\Ì�uI���`b5#j�-n��$�F$#�$�	�!���֫��%��l��r��I�h�8e'��ꯐ!)%e����?%bOb4�QZ�7I�9�������%�Il��,N�>�rN: �i���hr$2'�IU�}�ڋo��q�����eؐ���q%      �     x���1O�0��=��[[)���g�|L"�"��Z�Q�����,!�"ex���n�Y=mM��>����ؿ�c�q���9�w��5���u�(?����¼�?<�6f�|k�Z3# ^".�z%Q�K��]���?o�J\)%c�gS1���Db%Í�XB|R K����!�!�L6bt)U0$a��0e_B"y�Z�"A�L0Q%dbDẹX*%5�W&�$oRr�$�JH�Ar	��bI�B�IB9`%� A~&i�oAp/�      �   �	  x��\�n���)��]�������!0vہa!�7@N�X3�H�$���<I��y�T%��;$A%R�-P�W���}U]�7�޿����ͻ'�j��rvj�t�M��T���gզ[���c��;�f_��s�\\u��g�싼��v}ٿ��c��������/����}�>� ?���s�]W�j��-���/T�ͦ��u�j%o5[|6O�U�~~�V^��s��	*�b��&�(�9k.7��z��qL�)&4����kMuԈT�76![z|#܃�������~�u@ʛ�-FT0�?���`(y���F�)F��yw�����L
�n��Cz|�C��k���'����ĈT�5�SrN����ܺ>�bM�$�4V�^\]� ��%J
4��z���1������4���0��'��E4)�>���Sm�u`&Q�DD0)�L��&��6L��60z�ID}��+�;��p�I<}\2�XA�&6��G�����V�� ��w
,�S7�V�8��9�N�Ȅ�v=��i۞��d09�D���\���0��޹�@ED��v>o�G��kJ(�J��b�����hG�:[�hR"d�e'����K�9kiT<����|c�&��)E^�B&���_�Gΐ ����z��9*��f�#8����@!hR*�P�Λys(���d���;;��91
`��7�y�y�I�<��#M�~V������Z	�1��w�_��Zy_���S���:i�#WP��Y�c&�(^#�1i��.)�O ���������G�\���Q�s��W#eo&�����ߚ�qF*�.H�'>$��Ʌ3W�z%�q�8*��8P^�G=F��@X� q�=����1���d�؉�!g�
�F��!��U�L�IhGDO_//��!	F�d�M^#���DY|l����8Ҕc�MA�j��<��u��6�j��m����%�p ���o/�@ֱ���#S�!���6����'�B��E�����@R�(�S\F�=l�͇"������=������?��ȇ�AF�� ^G�?E�w&p.!���AI�����m�@&�M��R�P�W�����2��P9L�5�g��x��g�F*b�� �"h�����a[�ή��^j�U�/���e@��v���D�FM,Ļc�y�`2Q!}
�>�%��Ș��*�XP�`Ij�I���ޘ��;��r���Z��D���5������8�3�� �M��c:�X�FP:6mb���&�dk�(e� r���	{��0�)Ȅ�;s���@��
D��5��f�Ft�S�� N��bQM��f�h�"c=� M��9T��c6�)�B0J��q>�(�(��a��
Rj/.�!Wr��ry
I�',����ڕ;�>_-S@���D���-$vW�d��(M��� c.Gz/y��z��������e�n~�~�璒"�����j�/��h����'ر�E�#����k ��#��<I4�j�]�(�WP*����#�����8^CM�-���v~t7d���G��W[����_^É�o�#9�2���|$�RϮ�[�ؙ`�6uz�R��l��R`�7(E���Z�u���?!'��@�_�3io:�;:���Ay��t�U�'Yd���q2�
RQW1�Fo!؂��,�/�p�	9�j�y(��b}qv'���H�UFb�HP·�(�M���ER;�;4 8IÇ�W3u����wM�c0�p'��ր�n��7(Q�'��1^P� WKnP�1h\��?����X[�u%Q�j�����)�2G��FPφ�k��mM1�J��E3�p[�5L�3�N�����P ��:X�	9���gK^���/`.�,��r�ɡ�x�'�h�y�Ĝ�h`,Jg��\ݛ\[��I��8��M�_����}1���:�<]Ɨ����Κ��%�E[�f�ݎ��}Ţ'�|>��Cُ� E��Y� 7"e�"�Ү�8Y儿c�j�7v�š.�q�b�����@��&y��F''PQ��q���e�,^u��IC�S�6�����6�}A��!�#�Fs�"k�۶�~�κ�`_�m4`٩�G�]�t�� ��i�T�j��ݵ���._�ۤ�a�����e346�}h��w&A`��R�_jh�1FClu�Ln�Lʝ�\"��E���`�˓�*��R`�����.�J]�q=�E�(1P%ק��m\���F�dA�e��[�J���C�D�h�(&�dQ��:���P�<�M�Ic4
�h��E�(	k�>��v�m��;�N�iM�I�s7��T�y";9�� _̜��+���o������i�7��h�#V���8�P�se���jH7��dQ�3LU�Q_�t�:S�'�J����z7��ѨDʐ��}"��8�wO�ra?�썳N�/��u�$��~�U��Q�C��=
���=v��8�� �t��|i���q��Xg"�o�l�<�?!1�Q      �   )  x����j1�O17�53�MLz*ԃP,T�U�dk7�`}��X�xiў�\����O���}����nw��y��¨*3�Z�^&�p��3�>����ٻ�˭�c�x~��W0��Rõ���=��f�6�]s�l����dH�`d�9\�9OP�C@cI[��@�����Gf"�L_�����f���\
m�� �-�����R��!��D@h��lrVdfԷr��*U܅S���k����U�o#NH�NXf[�\���6��e�up[��"y�3��d,�A���`�"��?      �   �  x�ŕKo�0F��YTj+1!�fSޠ )��Meb�b����I�tJՁE���~7�GW7���x
����tb_�)�i|L	b�=�%!e(! B%E �%!�a~�c[��	ڤ�aNYI qB� Ғp����K��a\��po���9!�����
D��tGC ��p�s��ˏQQ�甾��cƋ���V�n3���nZ�&����4��:��7�KZ�=j��ڳ��&�H�Lw�|9�C
 +���%��bj�.�.��8�y��#�I���>-{|�}ӹ�_;���0��d�ij�O����q��ĬAw`q5`�`��|���e���>W�苭��uՐmI3O-�i����CK��mY�1��T`'ۈy(Y�S�u�p@P�In�X5UwY��)���l�6�e׍P��:�Z� �l>�^Y�@n{��j�)I�}*����J�}� �+�tu�ʻ��<�<�>���j[)�5q6�z�n�"�e�ʺ�n3\�@�uVM�Jܳirִ�*�m��Ͳ8b�����ru��A\��5~�6z��u1�̶A��sg�oȯ����t���Q��e{{5l(e�+�L���Uݶ-��;�${�����rL�"�	9���aJ����?;�"�B�j��w:3��"�����lОN��N��hC2v���НĻ�x���h�����p�xl�a���/6�"      �   �   x�ő1o�0������c|w8NҩC��J@Y��XQ-i���:�2u��wwғ>�r�]mvP�w�Ѝ臨����\}��o�O����ѻ�0���t�������	��F/�ꝝB� ���������m��*��H��*�⍛�\O��	b���ˌP�����;�m�?�	F挴a��k��ST>�ol��v� �)ɩZ���\�*����72
���N��К����iM�I�~Ѣ�so�      �   D  x�͒;o�0�w~��R~%�ө�R���!��U^M�>�}�R�,��}��w��l�/;Xmv�Pw����~�05���+S�K�����VU�k�K瘛��k�)u�>\ާ�+�5��Ӧg��o*��'L�&w*j�Y��^����ԇ��|�2��d��O�/���
>;�*�|�6���]�W:k��Tr�)�$����a��9�sƀ�	�B(Wқ=LV#��P>S `yԥ푰;��"��Q�LTBH"X*)9;�"���~���o:o�Zܒ�@T"�$��x�~����M���QB�s���ZtHY      �   �   x�ŏ��0Fw��nbR������@b4�o%H�Jh�������N�{�Sλ�����t�L������������Al4������7�[[գ70MA3��ouU{Ӡg^�m����g���նi�!(��)IyBi���S,S���K���B�s�$�/a���5��2���9e\.G!㘈\|���'�4{S      �   �   x��α
�0��ݧ��
QL4�ک�� �vQC	XS��範�@��r��W�Mqk���+��~�Cdq�v2h��#����m����B@Z��JDc�\P[t��B���d?)â$n�� +�J`�uWUpY���b����,�s��i3���!8{�ߴ��&;ѦN��D˝��DK��������      �   L  x�Ŕ�k�0����V�v��U۝z���*϶Ӈ]S�����%JG�9!�� y��x�r�^�l`��<A{��T�i�Z�-JMJo���դ�0�2��}�R��BP�,m5}�1��`mfe�
I�&ь����u���8���pƓ(f�fƲ�1��X˓9�	�����E���
�B����[����R1s3mՀ�%��/q�:��v�,Ź*����\�{r�G�_D�_�w���ދ��6��q��'���x'�	�� $z��,v�#��jEC��,H�f��I�H:��$g���Z�˚�}��X��n���t撎/V�<�n+�b?"\�      �   �   x�E�OO�0����u��n)cm�	�*�@�p��Ī��$ʟ��i���{~���S�>@^���D0cF�T��JI�[�S��BPJG�3��S6(��N4F73�0�10�Kb�k�||��N��x� �'=�~���H3<���7g�J�
����@<+�� i���䖝�@��G%�t��v6(��X����{��7m�+��<ն�����CՖu��u�TA])_?dY���a�      �   �  x�ݖ[s�:���)x�L����B���Z��zi��8�"A.���O��{����t`$Y���/�/��i{2S���HI
7�Zd,͔ܯ)�kL����-�QMIh���T�\��T<b��{5�K͙��yMIE$�Φ<[����I��Gs.�U.�Y,'�����?�e��ˮ����О*?0�)WIrujo�D�Ķ����K.��~��à>���"5s�_;Ų�0��Nߡ�e^�;�pЬ_�8��fpWګeS/�HP?�W"��iDG��j��Lh�5��Q��@��մ,P9Z&��!K�|4�dF�(!V��y���Þ\�� � ��u1�@u��j��B�+���r���۟]���������ȧ*WiJ�_��T/�0'27�QgLzx���ts�x`��H�$�/v�^����h}���o�e>>��5��������ӂU3��et>���SW�V�������zxXL�l!.vAk������p<:κ0�Su7bw��Ѽ��H�Ⱦ<M&��҈e����\�y�P��ä��e�+.���M�oaҜ�B���8�7�����ug.҅3���aO�M[�w��_;�'�6}���[���i{^ڇB��K*P3��b�NE�@��AH��,�M��P���i.�Q��,������!2ăq�ϑ���+p���sht�E4Z��f��M�kڏ�}o��/�Kc֜��������T�dt_�1 2�E�Gl̆f5���%~Ȇ�E��ߔ*Ōe!��:!��
�����.�v���z��fc�a/ӂ�������n �6���>Ќ�I�Yy}����'�w%ӵ��UYU�sai���o^6i��oJD{߃� Ѫ�}\�����_�x�-nG�:�6�6��E��Ѡkpg���Wolۧc2`J������&�5C:���O�@]�11��jv�u�����߀y�7     