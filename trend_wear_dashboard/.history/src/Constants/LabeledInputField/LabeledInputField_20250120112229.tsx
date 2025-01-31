import "./LabeledInputField.css";
interface Props {
  children: React.ReactNode;
  placeHolder?: string;
}

const LabeledInputField = ({ prefix, placeHolder, children }: Props) => {
  return (
    <>
      <p id="input-field-label">{children}</p>
      <input prefix="placeholder" id="input-field" type="text" />
    </>
  );
};

export default LabeledInputField;
