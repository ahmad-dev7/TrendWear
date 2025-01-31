interface Props {
  children: React.ReactNode;
}

const LabeledTextArea = ({ children }: Props) => {
  return (
    <>
      <p id="input-field-label">{children}</p>
      <textarea id="input-field-textarea" type="text" />
    </>
  );
};

export default LabeledTextArea;
