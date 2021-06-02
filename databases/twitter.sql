--
-- Name: user_user_id_seq; Type: SEQUENCE; Schema: public;
--

CREATE SEQUENCE public.user_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

--
-- Name: user; Type: TABLE; Schema: public;
--

CREATE TABLE public.user (
    user_id integer DEFAULT nextval('public.user_user_id_seq'::regclass) NOT NULL UNIQUE,
    username character varying(16) NOT NULL,
    password character varying(40)
);

--
-- Name: user_info; Type: TABLE; Schema: public;
--

CREATE TABLE public.user_info (
    user_id smallint NOT NULL,
    first_name character varying(45) NOT NULL,
    last_name character varying(45) NOT NULL,
    email character varying(50),
    activebool boolean DEFAULT true NOT NULL,
    create_date date DEFAULT ('now'::text)::date NOT NULL,
    last_update timestamp without time zone DEFAULT now()
);

--
-- Name: customer user_info_user_id_fkey; Type: FK CONSTRAINT; Schema: public; 
--

ALTER TABLE ONLY public.user_info
    ADD CONSTRAINT user_info_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.user(user_id) ON UPDATE CASCADE ON DELETE RESTRICT;

--
-- Name: tweet_tweet_id_seq; Type: SEQUENCE; Schema: public; 
--

CREATE SEQUENCE public.tweet_tweet_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

--
-- Name: tweet; Type: TABLE; Schema: public; 
--

CREATE TABLE public.tweet (
    tweet_id integer DEFAULT nextval('public.tweet_tweet_id_seq'::regclass) NOT NULL UNIQUE,
    user_id smallint NOT NULL,
    summary text,
    create_date date DEFAULT ('now'::text)::date NOT NULL,
    last_update timestamp without time zone DEFAULT now(),
    likes integer
);

--
-- Name: tweet tweet_user_id_fkey; Type: FK CONSTRAINT; Schema: public; 
--

ALTER TABLE ONLY public.tweet
    ADD CONSTRAINT tweet_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.user(user_id) ON UPDATE CASCADE ON DELETE RESTRICT;

--
-- Name: media_media_id_seq; Type: SEQUENCE; Schema: public; 
--

CREATE SEQUENCE public.media_media_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

--
-- Name: media; Type: TABLE; Schema: public;
--

CREATE TABLE public.media (
    media_id integer DEFAULT nextval('public.media_media_id_seq'::regclass) NOT NULL,
    user_id smallint NOT NULL,
    tweet_id smallint NOT NULL,
    file text
);

--
-- Name: media media_user_id_fkey; Type: FK CONSTRAINT; Schema: public; 
--

ALTER TABLE ONLY public.media
    ADD CONSTRAINT media_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.user(user_id) ON UPDATE CASCADE ON DELETE RESTRICT;

--
-- Name: media media_tweet_id_fkey; Type: FK CONSTRAINT; Schema: public; 
--

ALTER TABLE ONLY public.media
    ADD CONSTRAINT media_tweet_id_fkey FOREIGN KEY (tweet_id) REFERENCES public.tweet(tweet_id) ON UPDATE CASCADE ON DELETE RESTRICT;

--
-- Name: liked_tweet_liked_tweet_id_seq; Type: SEQUENCE; Schema: public; 
--

CREATE SEQUENCE public.liked_tweet_liked_tweet_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

--
-- Name: liked_tweet; Type: TABLE; Schema: public;
--

CREATE TABLE public.liked_tweet (
    liked_tweet_id integer DEFAULT nextval('public.liked_tweet_liked_tweet_id_seq'::regclass) NOT NULL,
    user_id smallint NOT NULL,
    tweet_id smallint NOT NULL
);

--
-- Name: liked_tweet liked_tweet_user_id_fkey; Type: FK CONSTRAINT; Schema: public; 
--

ALTER TABLE ONLY public.liked_tweet
    ADD CONSTRAINT liked_tweet_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.user(user_id) ON UPDATE CASCADE ON DELETE RESTRICT;

--
-- Name: media liked_tweet_tweet_id_fkey; Type: FK CONSTRAINT; Schema: public; 
--

ALTER TABLE ONLY public.liked_tweet
    ADD CONSTRAINT liked_tweet_tweet_id_fkey FOREIGN KEY (tweet_id) REFERENCES public.tweet(tweet_id) ON UPDATE CASCADE ON DELETE RESTRICT;

--
-- Name: comment_comment_id_seq; Type: SEQUENCE; Schema: public; 
--

CREATE SEQUENCE public.comment_comment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

--
-- Name: comment; Type: TABLE; Schema: public;
--

CREATE TABLE public.comment (
    comment_id integer DEFAULT nextval('public.comment_comment_id_seq'::regclass) NOT NULL,
    user_id smallint NOT NULL,
    tweet_id smallint NOT NULL,
    content text
);

--
-- Name: comment comment_user_id_fkey; Type: FK CONSTRAINT; Schema: public; 
--

ALTER TABLE ONLY public.comment
    ADD CONSTRAINT comment_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.user(user_id) ON UPDATE CASCADE ON DELETE RESTRICT;

--
-- Name: comment comment_tweet_id_fkey; Type: FK CONSTRAINT; Schema: public; 
--

ALTER TABLE ONLY public.comment
    ADD CONSTRAINT comment_tweet_id_fkey FOREIGN KEY (tweet_id) REFERENCES public.tweet(tweet_id) ON UPDATE CASCADE ON DELETE RESTRICT;

--
-- Name: notification_notification_id_seq; Type: SEQUENCE; Schema: public; 
--

CREATE SEQUENCE public.notification_notification_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

--
-- Name: notification; Type: TABLE; Schema: public;
--

CREATE TABLE public.notification (
    notification_id integer DEFAULT nextval('public.notification_notification_id_seq'::regclass) NOT NULL,
    user_id smallint NOT NULL,
    summary text,
    create_date date DEFAULT ('now'::text)::date NOT NULL,
    last_update timestamp without time zone DEFAULT now()
);

--
-- Name: notification notification_user_id_fkey; Type: FK CONSTRAINT; Schema: public; 
--

ALTER TABLE ONLY public.notification
    ADD CONSTRAINT notification_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.user(user_id) ON UPDATE CASCADE ON DELETE RESTRICT;

--
-- Name: chat_chat_id_seq; Type: SEQUENCE; Schema: public; 
--

CREATE SEQUENCE public.chat_chat_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

--
-- Name: chat; Type: TABLE; Schema: public;
--

CREATE TABLE public.chat (
    chat_id integer DEFAULT nextval('public.chat_chat_id_seq'::regclass) NOT NULL unique,
    user_id1 smallint NOT NULL,
    user_id2 smallint NOT NULL,
    create_date date DEFAULT ('now'::text)::date NOT NULL
);

--
-- Name: chat chat_user_id1_fkey; Type: FK CONSTRAINT; Schema: public; 
--

ALTER TABLE ONLY public.chat
    ADD CONSTRAINT chat_user_id1_fkey FOREIGN KEY (user_id1) REFERENCES public.user(user_id) ON UPDATE CASCADE ON DELETE RESTRICT;

--
-- Name: chat chat_user_id2_fkey; Type: FK CONSTRAINT; Schema: public; 
--

ALTER TABLE ONLY public.chat
    ADD CONSTRAINT chat_user_id2_fkey FOREIGN KEY (user_id2) REFERENCES public.user(user_id) ON UPDATE CASCADE ON DELETE RESTRICT;

--
-- Name: message_message_id_seq; Type: SEQUENCE; Schema: public; 
--

CREATE SEQUENCE public.message_message_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

--
-- Name: message; Type: TABLE; Schema: public;
--

CREATE TABLE public.message (
    message_id integer DEFAULT nextval('public.message_message_id_seq'::regclass) NOT NULL unique,
    chat_id smallint NOT NULL,
    user_id smallint NOT NULL,
    text text,
    create_date date DEFAULT ('now'::text)::date NOT NULL,
    reaction text
);

--
-- Name: message message_user_id_fkey; Type: FK CONSTRAINT; Schema: public; 
--

ALTER TABLE ONLY public.message
    ADD CONSTRAINT message_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.user(user_id) ON UPDATE CASCADE ON DELETE RESTRICT;

--
-- Name: message message_chat_id_fkey; Type: FK CONSTRAINT; Schema: public; 
--

ALTER TABLE ONLY public.message
    ADD CONSTRAINT message_chat_id_fkey FOREIGN KEY (chat_id) REFERENCES public.chat(chat_id) ON UPDATE CASCADE ON DELETE RESTRICT;

--
-- Name: followship_followship_id_seq; Type: SEQUENCE; Schema: public; 
--

CREATE SEQUENCE public.followship_followship_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

--
-- Name: followship; Type: TABLE; Schema: public;
--

CREATE TABLE public.followship (
    followship_id integer DEFAULT nextval('public.followship_followship_id_seq'::regclass) NOT NULL unique,
    follower_id smallint NOT NULL,
    followee_id smallint NOT NULL
);

--
-- Name: followship followship_follower_id_fkey; Type: FK CONSTRAINT; Schema: public; 
--

ALTER TABLE ONLY public.followship
    ADD CONSTRAINT followship_follower_id_fkey FOREIGN KEY (follower_id) REFERENCES public.user(user_id) ON UPDATE CASCADE ON DELETE RESTRICT;

--
-- Name: followship followship_followee_id_fkey; Type: FK CONSTRAINT; Schema: public; 
--

ALTER TABLE ONLY public.followship
    ADD CONSTRAINT followship_followee_id_fkey FOREIGN KEY (followee_id) REFERENCES public.chat(chat_id) ON UPDATE CASCADE ON DELETE RESTRICT;









insert into public.user (username, password) values ('aida', 'aida'), ('zhanel', 'zhanel'), ('ais', 'ais');

select * from public.user;

insert into public.user (username, password) values ('aida', 'aida'), ('zhanel', 'zhanel'), ('ais', 'ais');


CREATE OR REPLACE FUNCTION public.write_user_info() RETURNS void 
LANGUAGE sql IMMUTABLE
AS $_$
INSERT INTO public.user_info (user_id) select user_id from public.user;
END
$_$;

drop function public.write_user_info();

  
CREATE OR REPLACE FUNCTION public.write_user_info(user_id integer, first_name varchar, last_name varchar, email varchar) RETURNS VOID AS
$$
BEGIN
    INSERT INTO public.user_info (user_id, first_name, last_name, email) VALUES (user_id, first_name, last_name, email);
END
$$
  LANGUAGE 'plpgsql';
  
SELECT public."write_user_info"(1, 'Aida', 'Ualibekova', 'ualibekova.aida@gmail.com');
SELECT public."write_user_info"(2, 'Zhanel', 'Turlybayeva', 'derzach5@gmail.com');
SELECT public."write_user_info"(3, 'Aisultan', 'Kali', 'ais.kali@gmail.com');

delete from public.user_info where user_id = 1;

select * from public.user_info;
  
CREATE FUNCTION public.get_user(user_id integer) RETURNS text
    LANGUAGE sql IMMUTABLE
    AS $_$
SELECT * from public.user_info where user_id = user_id
END
$_$;


CREATE FUNCTION public.get_user_count() RETURNS SETOF integer
    LANGUAGE sql
    AS $_$
     SELECT count(*)
     FROM public.user;
$_$;

select public."get_user_count"();


select u.user_id, u.username, ui.first_name, ui.last_name, ui.email, ui.create_date 
from public.user u left join public.user_info ui on u.user_id = ui.user_id order by u.user_id desc;



CREATE OR REPLACE FUNCTION public.create_tweet_with_media(user_id_ integer, summary_ text, file text) RETURNS VOID AS
$$
BEGIN
    INSERT INTO public.tweet (user_id, summary) VALUES (user_id_, summary_);
    INSERT INTO public.media (user_id, tweet_id, file) VALUES (user_id_, 
                                                               (select tweet_id from public.tweet t where t.user_id = user_id_ and t.summary = summary_),
                                                               file);
END
$$
  LANGUAGE 'plpgsql';
  

select public."create_tweet_with_media"(1, 'new tweet', 'https://www.planetware.com/wpimages/2020/02/france-in-pictures-beautiful-places-to-photograph-eiffel-tower.jpg');

select * from public.tweet;

select count(t.*) as "tweer_with_media" from public.tweet t left join media m on t.tweet_id = m.tweet_id group by t.tweet_id order by t.tweet_id;

select * from public.user where user_id in 
(select t.user_id from public.tweet t left join media m on t.tweet_id = m.tweet_id)
order by user_id;

