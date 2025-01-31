interface Props {
  children: React.ReactNode;
}

const LabeledTextArea = ({ children }: Props) => {
  return (
    <>
      <p id="input-field-label">{children}</p>
      <input id="input-field" type="text" />
    </>
  );
};

export default LabeledTextArea;
