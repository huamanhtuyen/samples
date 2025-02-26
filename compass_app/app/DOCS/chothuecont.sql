-- Table: public.chothuecont

-- DROP TABLE IF EXISTS public.chothuecont;

CREATE TABLE IF NOT EXISTS public.chothuecont
(
    id bigint NOT NULL GENERATED BY DEFAULT AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1 ),
    created_at timestamp with time zone NOT NULL DEFAULT now(),
    user_id uuid NOT NULL DEFAULT auth.uid(),
    mota text COLLATE pg_catalog."default", --mô tả
    tencty text COLLATE pg_catalog."default", -- tên công ty
    sdt1 text COLLATE pg_catalog."default", -- số điện thoại 1
    sdt2 text COLLATE pg_catalog."default", -- số điện thoại 2
    sdt3 text COLLATE pg_catalog."default",-- số điện thoại 3
    matinh text COLLATE pg_catalog."default",-- mã tỉnh
    tentinh_tiengviet text COLLATE pg_catalog."default",-- tên tỉnh tiếng việt
    tentinh_tienganh text COLLATE pg_catalog."default",-- tên tỉnh tiếng anh
    tentinh_tiengtrung text COLLATE pg_catalog."default",-- tên tỉnh tiếng trung
    tentinh_tiengthai text COLLATE pg_catalog."default",-- tên tỉnh tiếng thái
    maquan text COLLATE pg_catalog."default",-- mã quận
    tenquan_tiengviet text COLLATE pg_catalog."default",-- tên quận tiếng việt
    tenquan_tienganh text COLLATE pg_catalog."default",-- tên quận tiếng anh
    tenquan_tiengtrung text COLLATE pg_catalog."default",-- tên quận tiếng trung
    tenquan_tiengthai text COLLATE pg_catalog."default",-- tên quận tiếng thái
    anh1 text COLLATE pg_catalog."default",-- ảnh 1
    anh2 text COLLATE pg_catalog."default",-- ảnh 2
    anh3 text COLLATE pg_catalog."default",-- ảnh 3
    anh4 text COLLATE pg_catalog."default",-- ảnh 4
    anh5 text COLLATE pg_catalog."default",-- ảnh 5
    anh6 text COLLATE pg_catalog."default",-- ảnh 6
    anh7 text COLLATE pg_catalog."default",-- ảnh 7
    anh8 text COLLATE pg_catalog."default",-- ảnh 8
    anh9 text COLLATE pg_catalog."default",-- ảnh 9
    CONSTRAINT chothuecont_pkey PRIMARY KEY (id)
)
