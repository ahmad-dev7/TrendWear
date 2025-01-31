import "./LabeledInputField.css";
interface Props {
  children: React.ReactNode;
  placeHolder?: string;
}

const LabeledInputField = ({ placeHolder, children }: Props) => {
  return (
    <>
      <p id="input-field-label">{children}</p>

      <input placeholder={placeHolder} id="input-field" type="text" />
    </>
  );
};

export default LabeledInputField;
