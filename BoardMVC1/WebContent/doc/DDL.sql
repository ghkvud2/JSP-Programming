/* �Խ��� */
CREATE TABLE board (
	num NUMBER, /* �۹�ȣ */
	writer VARCHAR2(50), /* �۾��� */
	email VARCHAR2(50), /* �̸��� */
	subject VARCHAR2(100), /* ������ */
	password VARCHAR2(15), /* ��й�ȣ */
	reg_date DATE, /* �ۼ���¥ */
	ref NUMBER, /* �۱׷� */
	re_step NUMBER, /* �۽��� */
	re_level NUMBER, /* �۷��� */
	readcount NUMBER, /* ��ȸ�� */
	content CLOB /* �۳��� */
);

CREATE SEQUENCE board_num_seq START WITH 1 INCREMENT BY 1;

COMMENT ON TABLE board IS '�Խ���';

COMMENT ON COLUMN board.num IS '�۹�ȣ';

COMMENT ON COLUMN board.writer IS '�۾���';

COMMENT ON COLUMN board.email IS '�̸���';

COMMENT ON COLUMN board.subject IS '������';

COMMENT ON COLUMN board.password IS '��й�ȣ';

COMMENT ON COLUMN board.reg_date IS '�ۼ���¥';

COMMENT ON COLUMN board.ref IS '�۱׷�';

COMMENT ON COLUMN board.re_step IS '�۽���';

COMMENT ON COLUMN board.re_level IS '�۷���';

COMMENT ON COLUMN board.readcount IS '��ȸ��';

COMMENT ON COLUMN board.content IS '�۳���';