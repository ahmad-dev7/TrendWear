import "./LabeledInputField.css";
interface Props {
  children: React.ReactNode;
  prefix?: string;
}

const LabeledInputField = ({ prefix, children }: Props) => {
  return (
    <>
      <p id="input-field-label">{children}</p>

      <input prefix={prefix} id="input-field" type="text" />
    </>
  );
};

export default LabeledInputField;
